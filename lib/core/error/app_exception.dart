enum AppExceptionKind { validation, unauthorized, forbidden, notFound, server, network, unknown }

class AppException implements Exception {
  AppException({
    required this.kind,
    required this.message,
    this.fieldErrors = const {},
    this.statusCode,
  });

  final AppExceptionKind kind;
  final String message;
  final Map<String, List<String>> fieldErrors;
  final int? statusCode;

  factory AppException.fromResponse(int statusCode, Map<String, dynamic>? body) {
    final message = (body?['message'] as String?)?.trim();

    final fieldErrors = <String, List<String>>{};
    final rawErrors = body?['errors'];
    if (rawErrors is Map) {
      rawErrors.forEach((key, value) {
        if (value is List) {
          fieldErrors[key.toString()] = value.map((e) => e.toString()).toList();
        }
      });
    }

    final kind = switch (statusCode) {
      401 => AppExceptionKind.unauthorized,
      403 => AppExceptionKind.forbidden,
      404 => AppExceptionKind.notFound,
      422 => AppExceptionKind.validation,
      >= 500 => AppExceptionKind.server,
      _ => AppExceptionKind.unknown,
    };

    return AppException(
      kind: kind,
      statusCode: statusCode,
      fieldErrors: fieldErrors,
      message: message?.isNotEmpty == true ? message! : _defaultMessageFor(kind),
    );
  }

  factory AppException.network() => AppException(
        kind: AppExceptionKind.network,
        message: "You're offline. We'll sync when you're back online.",
      );

  static String _defaultMessageFor(AppExceptionKind kind) => switch (kind) {
        AppExceptionKind.unauthorized => 'Please sign in again.',
        AppExceptionKind.forbidden => "You don't have access to this.",
        AppExceptionKind.notFound => "We couldn't find that.",
        AppExceptionKind.validation => 'Please check the highlighted fields.',
        AppExceptionKind.server => 'Something went wrong. Please try again.',
        AppExceptionKind.network => "You're offline. Please check your connection.",
        AppExceptionKind.unknown => 'Something went wrong. Please try again.',
      };

  @override
  String toString() => 'AppException(${kind.name}, $statusCode, $message)';
}
