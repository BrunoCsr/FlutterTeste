import 'package:c214_seminario/SquareWidget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:c214_seminario/main.dart';

void main() {
  testWidgets('Verifica se incrementa a variável de cliques',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('Cliques: 0. Cliques duplos: 0.'), findsOneWidget);

    await tester.tap(find.byType(ClipRRect));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Cliques: 1. Cliques duplos: 0.'), findsOneWidget);
  });

  testWidgets('Teste de falha para o incremento da variável de cliques',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('Cliques: 0. Cliques duplos: 0.'), findsOneWidget);

    await tester.tap(find.byType(ClipRRect));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Cliques: 2. Cliques duplos: 10.'), findsNothing);
  });

  testWidgets('Cliques duplos', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    //expect(find.text('Cliques: 0. Cliques duplos: 0.'), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.tap(find.byType(SquareWidget));
    await tester.pump(kDoubleTapMinTime); // <- Add this
    await tester.tap(find.byType(SquareWidget));
    await tester.pumpAndSettle();

    expect(find.text('Cliques: 0. Cliques duplos: 1.'), findsOneWidget);
  });
}
