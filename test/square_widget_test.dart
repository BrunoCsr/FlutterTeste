import 'package:c214_seminario/SquareWidget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:c214_seminario/main.dart';

void main() {
  testWidgets('Contador inicia zerado', (WidgetTester tester) async {
    //ARRANGE
    await tester.pumpWidget(const MyApp());
    //ASSERT
    expect(find.text('Cliques: 0. Cliques duplos: 0.'), findsOneWidget);
  });

  testWidgets(
      'Para um clique no Widget o contador deve ser incrementado uma vez',
      (WidgetTester tester) async {
    //ARRANGE
    await tester.pumpWidget(const MyApp());

    //ACT
    await tester.tap(find.byType(ClipRRect));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    //ASSERT
    expect(find.text('Cliques: 1. Cliques duplos: 0.'), findsOneWidget);
  });

  testWidgets('Teste de falha para o clique simples',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Cliques: 0. Cliques duplos: 0.'), findsOneWidget);

    await tester.tap(find.byType(ClipRRect));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Cliques: 2. Cliques duplos: 10.'), findsNothing);
  });

  testWidgets(
      'Para um clique duplo no Widget, o contador deve ser incrementado em um',
      (WidgetTester tester) async {
    //ARRANGE
    await tester.pumpWidget(const MyApp());

    //ACT
    await tester.pumpAndSettle();
    await tester.tap(find.byType(SquareWidget));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byType(SquareWidget));
    await tester.pumpAndSettle();

    //ASSERT
    expect(find.text('Cliques: 0. Cliques duplos: 1.'), findsOneWidget);
  });

  testWidgets('SquareWidget, quando iniciado, tem cor azul',
      (WidgetTester tester) async {
    //ARRANGE
    final SquareWidget squareWidget = SquareWidget(size: 300);

    //ASSERT
    expect(squareWidget.color, Colors.blue);
  });

  testWidgets('SquareWidget, quando clicado tem cor laranja amber',
      (WidgetTester tester) async {
    //ARRANGE
    await tester.pumpWidget(const MyApp());

    //ACT
    await tester.tap(find.byType(SquareWidget));
    await tester.pump(const Duration(seconds: 1));

    //ASSERT
    expect(
        (tester.firstWidget(find.byType(SquareWidget)) as SquareWidget).color,
        Colors.amber);
  });

  testWidgets(
      'SquareWidget, quando clicado duas vezes em sequência, tem cor azul',
      (WidgetTester tester) async {
    //ARRANGE
    await tester.pumpWidget(const MyApp());

    //ACT
    await tester.tap(find.byType(SquareWidget));
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.byType(SquareWidget));
    await tester.pump(const Duration(seconds: 1));

    //ASSERT
    expect(
        (tester.firstWidget(find.byType(SquareWidget)) as SquareWidget).color,
        Colors.blue);
  });

  testWidgets('Clique duplo sobre o SquareWidget não altera sua cor',
      (WidgetTester tester) async {
    //ARRANGE
    await tester.pumpWidget(const MyApp());

    //ACT
    await tester.pumpAndSettle();
    await tester.tap(find.byType(SquareWidget));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byType(SquareWidget));
    await tester.pumpAndSettle();
    //ASSERT
    expect(
        (tester.firstWidget(find.byType(SquareWidget)) as SquareWidget).color,
        Colors.blue);
  });

  testWidgets(
      'SquareWidget, quando clicado nove vezes em sequência, tem cor laranja amber',
      (WidgetTester tester) async {
    //ARRANGE
    await tester.pumpWidget(const MyApp());

    //ACT
    for (int i = 0; i < 9; i++) {
      await tester.tap(find.byType(SquareWidget));
      await tester.pump(const Duration(seconds: 1));
    }

    //ASSERT
    expect(
        (tester.firstWidget(find.byType(SquareWidget)) as SquareWidget).color,
        Colors.amber);
  });
}
