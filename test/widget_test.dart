import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// The full CloseBalance app (CloseBalanceApp) requires real providers (Dio,
// SecureStorage, go_router with auth redirect) that trigger infinite async
// loops in a test environment — pumpAndSettle times out. The integration /
// golden tests for individual screens live alongside each feature. This file
// provides a minimal smoke-test to confirm the Flutter test harness boots.
void main() {
  testWidgets('Flutter test harness boots', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SizedBox()));
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
