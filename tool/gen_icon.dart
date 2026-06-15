import 'dart:io';
import 'package:image/image.dart' as img;

void main() {
  final src = File('../public/images/icon-dark.webp').readAsBytesSync();
  // Try webp-specific decoder first, fall back to auto-detect
  final img.Image? decoded = img.decodeWebP(src) ?? img.decodeImage(src);
  if (decoded == null) {
    stderr.writeln('Failed to decode webp');
    exit(1);
  }
  final resized = img.copyResize(decoded, width: 1024, height: 1024);
  Directory('assets/icon').createSync(recursive: true);
  File('assets/icon/app_icon.png').writeAsBytesSync(img.encodePng(resized));
  stdout.writeln('Wrote assets/icon/app_icon.png (${resized.width}x${resized.height})');
}
