import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xy_scroll/xy_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      160, // 行数
          (row) => List.generate(
        180, // 各行のアイテム数
            (col) {
          // ランダムな背景色を生成
          final backgroundColor =
          Color((0xFFFFFFFF & Random().nextInt(0xFFFFFFFF)) | 0xFF000000);
          // 背景色の輝度を計算
          final brightness = backgroundColor.computeLuminance();
          // 輝度に応じてテキスト色を白か黒に設定
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
    return MaterialApp(
      title: 'XyScroll Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('XyScroll Example')),
        body: XyScroll(
          items:items,
        ),
      ),
    );
  }
}
