import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:xy_scroll/xy_scroll.dart';

void main() {
  testWidgets('XyScroll widget test', (WidgetTester tester) async {
    final items = List.generate(
      60,
      (row) => List.generate(
        80,
        (col) {
          final backgroundColor =
              Color((0xFFFFFFFF & Random().nextInt(0xFFFFFFFF)) | 0xFF000000);
          final brightness = backgroundColor.computeLuminance();
          final textColor = brightness > 0.5 ? Colors.black : Colors.white;

          return Card(
            color: backgroundColor,
            child: Column(
              children: [
                Text(
                  'Hello',
                  style: TextStyle(fontSize: 32, color: textColor),
                ),
                Text(
                  'World',
                  style: TextStyle(fontSize: 96, color: textColor),
                ),
              ],
            ),
          );
        },
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: XyScroll(items: items),
      ),
    );

    // ウィジェットが正しくレンダリングされることを確認
    expect(find.byType(XyScroll), findsOneWidget);
    expect(find.text('Hello'), findsWidgets);
    expect(find.text('World'), findsWidgets);

    // スクロールのテストなども追加することを推奨
  });
}
