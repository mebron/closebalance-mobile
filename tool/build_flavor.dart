/// Build automation script for white-label flavors.
///
/// Usage:
///   dart tool/build_flavor.dart <flavor> [--release] [--skip-icons] [--skip-splash]
///
/// Examples:
///   dart tool/build_flavor.dart almadina --release
///   dart tool/build_flavor.dart closebalance
///
/// Requires: dart, flutter on PATH.
/// The API at APP_BASE_URL/api/v1/branding/<slug> must be accessible.
library;

import 'dart:convert';
import 'dart:io';

// Map flavor name → company slug on the backend.
const Map<String, String> flavorSlugs = {
  'closebalance': 'closebalance',
  'almadina': 'al-madina',
  'juicy': 'juicy',
};

const String apiBaseUrl = 'https://closebalance.com';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    _usage();
    exit(1);
  }

  final flavor = args.first;
  final isRelease = args.contains('--release');
  final skipIcons = args.contains('--skip-icons');
  final skipSplash = args.contains('--skip-splash');

  if (!flavorSlugs.containsKey(flavor)) {
    stderr.writeln('Unknown flavor "$flavor". Known: ${flavorSlugs.keys.join(', ')}');
    exit(1);
  }

  final slug = flavorSlugs[flavor]!;
  _log('Building flavor: $flavor (slug: $slug)');

  // Step 1 — Fetch branding from API.
  final branding = await _fetchBranding(slug);
  if (branding != null) {
    _log('Branding loaded from server.');

    // Step 2 — Download icon if available.
    final iconUrl = branding['icon_url'] as String?;
    if (iconUrl != null && iconUrl.isNotEmpty) {
      final ok = await _downloadFile(iconUrl, 'assets/icon/$flavor/app_icon.png');
      if (ok) {
        _log('Icon downloaded.');
      }
    } else {
      _log('No icon URL in branding — using existing assets/icon/$flavor/app_icon.png');
    }

    // Step 3 — Patch YAML files with branding colors.
    final splashBg = (branding['splash_bg_color'] as String?) ?? '#00182A';
    final adaptiveBg = (branding['primary_color'] as String?) ?? '#00182A';
    await _patchIconYaml(flavor, adaptiveBg);
    await _patchSplashYaml(flavor, splashBg);
  } else {
    _log('Could not load branding from server — using existing YAML and icon files.');
  }

  // Step 4 — Generate launcher icons.
  if (!skipIcons) {
    _log('Generating launcher icons...');
    await _run('dart', [
      'run', 'flutter_launcher_icons',
      '-f', 'flutter_launcher_icons-$flavor.yaml',
    ]);
  }

  // Step 5 — Generate splash screens.
  if (!skipSplash) {
    _log('Generating splash screens...');
    await _run('dart', [
      'run', 'flutter_native_splash:create',
      '--flavor=$flavor',
    ]);
  }

  // Step 6 — Build APK.
  final buildArgs = [
    'build', 'apk',
    '--flavor', flavor,
    '-t', 'lib/main_${flavor == 'closebalance' ? '' : flavor}.dart'.replaceAll('main_.dart', 'main.dart'),
    '--dart-define=API_BASE_URL=$apiBaseUrl',
    if (isRelease) '--release',
  ];
  _log('Building APK: flutter ${buildArgs.join(' ')}');
  await _run('flutter', buildArgs);

  _log('Done! APK at: build/app/outputs/flutter-apk/app-$flavor-${isRelease ? 'release' : 'debug'}.apk');
}

Future<Map<String, dynamic>?> _fetchBranding(String slug) async {
  try {
    final client = HttpClient();
    final req = await client.getUrl(Uri.parse('$apiBaseUrl/api/v1/branding/$slug'));
    final res = await req.close();
    if (res.statusCode != 200) {
      _log('Branding API returned ${res.statusCode} — skipping server fetch.');
      return null;
    }
    final body = await res.transform(utf8.decoder).join();
    client.close();
    return jsonDecode(body) as Map<String, dynamic>;
  } catch (e) {
    _log('Could not reach branding API: $e');
    return null;
  }
}

Future<bool> _downloadFile(String url, String localPath) async {
  try {
    final file = File(localPath);
    await file.parent.create(recursive: true);
    final client = HttpClient();
    final req = await client.getUrl(Uri.parse(url));
    final res = await req.close();
    final contentType = res.headers.contentType?.mimeType ?? '';
    if (!contentType.startsWith('image/')) {
      _log('Icon URL returned $contentType (not an image) — keeping existing file.');
      client.close();
      return false;
    }
    await res.pipe(file.openWrite());
    client.close();
    return true;
  } catch (e) {
    _log('Could not download file: $e — keeping existing file.');
    return false;
  }
}

Future<void> _patchIconYaml(String flavor, String adaptiveBg) async {
  final file = File('flutter_launcher_icons-$flavor.yaml');
  if (!file.existsSync()) {
    return;
  }
  var content = await file.readAsString();
  content = content.replaceAll(
    RegExp(r'adaptive_icon_background: "#[0-9A-Fa-f]+"'),
    'adaptive_icon_background: "$adaptiveBg"',
  );
  await file.writeAsString(content);
}

Future<void> _patchSplashYaml(String flavor, String splashBg) async {
  final file = File('flutter_native_splash-$flavor.yaml');
  if (!file.existsSync()) {
    return;
  }
  var content = await file.readAsString();
  content = content.replaceAll(
    RegExp(r'color: "#[0-9A-Fa-f]+"'),
    'color: "$splashBg"',
  );
  await file.writeAsString(content);
}

Future<void> _run(String exe, List<String> args) async {
  final result = await Process.run(exe, args, runInShell: true);
  stdout.write(result.stdout);
  if (result.exitCode != 0) {
    stderr.write(result.stderr);
    exit(result.exitCode);
  }
}

void _log(String msg) => stdout.writeln('[build_flavor] $msg');

void _usage() {
  stdout.writeln('Usage: dart tool/build_flavor.dart <flavor> [--release] [--skip-icons] [--skip-splash]');
  stdout.writeln('Known flavors: ${flavorSlugs.keys.join(', ')}');
}
