import 'package:closebalance_mobile/core/error/app_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppException.fromResponse', () {
    test('parses 422 with field errors', () {
      final e = AppException.fromResponse(422, {
        'message': 'The given data was invalid.',
        'errors': {
          'amount': ['The amount field is required.'],
        },
      });

      expect(e.kind, AppExceptionKind.validation);
      expect(e.message, 'The given data was invalid.');
      expect(e.fieldErrors['amount'], ['The amount field is required.']);
    });

    test('maps 401 to unauthorized', () {
      final e = AppException.fromResponse(401, {'message': 'Invalid credentials.'});
      expect(e.kind, AppExceptionKind.unauthorized);
      expect(e.message, 'Invalid credentials.');
    });

    test('maps 403 to forbidden', () {
      final e = AppException.fromResponse(403, {'message': 'No access.'});
      expect(e.kind, AppExceptionKind.forbidden);
    });

    test('network() produces an offline-friendly message', () {
      final e = AppException.network();
      expect(e.kind, AppExceptionKind.network);
      expect(e.message, isNotEmpty);
    });

    test('falls back to a generic message when body has none', () {
      final e = AppException.fromResponse(500, null);
      expect(e.kind, AppExceptionKind.server);
      expect(e.message, isNotEmpty);
    });
  });
}
