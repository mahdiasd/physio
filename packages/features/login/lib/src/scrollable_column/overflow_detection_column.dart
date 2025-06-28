import 'package:flutter/material.dart';

class OverflowDetectingColumn extends StatefulWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double spacing;

  const OverflowDetectingColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.spacing = 0,
  });

  @override
  State<OverflowDetectingColumn> createState() => _OverflowDetectingColumnState();
}

class _OverflowDetectingColumnState extends State<OverflowDetectingColumn> {
  bool _isOverflowing = false;
  final GlobalKey _columnKey = GlobalKey();

  void _checkOverflow(BoxConstraints constraints) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _columnKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final contentHeight = renderBox.size.height;
        final maxHeight = constraints.maxHeight;

        final hasOverflow = contentHeight > maxHeight;

        if (_isOverflowing != hasOverflow) {
          setState(() {
            _isOverflowing = hasOverflow;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _checkOverflow(constraints);

        final column = Column(
          key: _columnKey,
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          mainAxisSize: widget.mainAxisSize,
          children: widget.spacing > 0
              ? _addSpacing(widget.children, widget.spacing)
              : widget.children,
        );

        if (_isOverflowing) {
          return SingleChildScrollView(
            child: column,
          );
        } else {
          return column;
        }
      },
    );
  }

  List<Widget> _addSpacing(List<Widget> children, double spacing) {
    if (children.isEmpty) return [];

    final spacedChildren = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(SizedBox(height: spacing));
      }
    }
    return spacedChildren;
  }
}
