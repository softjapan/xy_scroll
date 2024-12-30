library xy_scroll;

import 'package:flutter/material.dart';

/// A widget that creates a two-dimensional scrollable grid of widgets.
///
/// This widget allows both vertical and horizontal scrolling of content organized
/// in a 2D grid format.
class XyScroll extends StatefulWidget {
  /// The 2D list of widgets to display in the grid.
  final List<List<Widget>> items;

  /// The spacing between vertical items.
  final double verticalSpacing;

  /// Custom scroll physics for vertical scrolling.
  final ScrollPhysics? verticalPhysics;

  /// Custom scroll physics for horizontal scrolling.
  final ScrollPhysics? horizontalPhysics;

  /// Padding around the entire scroll view.
  final EdgeInsetsGeometry? padding;

  const XyScroll({
    super.key,
    required this.items,
    this.verticalSpacing = 20.0,
    this.verticalPhysics,
    this.horizontalPhysics,
    this.padding,
  });

  @override
  State<XyScroll> createState() => _State();
}

class _State extends State<XyScroll> {
  // 2次元スクロールビューを生成する関数
  Widget buildTwoDimensionalScroll() {
    return ListView.separated(
      physics: widget.verticalPhysics,
      padding: widget.padding,
      itemCount: widget.items.length,
      separatorBuilder: (context, index) =>
          SizedBox(height: widget.verticalSpacing),
      itemBuilder: (context, rowIndex) {
        return Stack(
          children: [
            IgnorePointer(
              child: Opacity(opacity: 0.0, child: widget.items[rowIndex][0]),
            ),
            const SizedBox(
              width: double.infinity,
            ),
            Positioned.fill(
              child: ListView.builder(
                physics: widget.horizontalPhysics,
                itemCount: widget.items[rowIndex].length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, colIndex) =>
                    widget.items[rowIndex][colIndex],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      body: buildTwoDimensionalScroll(),
    );
  }
}
