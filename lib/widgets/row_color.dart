import 'package:flutter/material.dart';
import 'package:vshop/constants/style.dart';

class RowColor extends StatefulWidget {
  int? currentIndex;
  final Function(int index) onTap;
  final List<Color> colors;

  RowColor(
      {Key? key,
      this.currentIndex = 0,
      required this.onTap,
      required this.colors})
      : super(key: key);

  @override
  State<RowColor> createState() => _RowColorState();
}

class _RowColorState extends State<RowColor> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < widget.colors.length; i++) {
      var child = InkWell(
        onTap: () {
          setState(() {
            widget.onTap(i);
            widget.currentIndex = i;
          });
        },
        borderRadius: defaultBorderRadius,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.colors[i],
            borderRadius: defaultBorderRadius,
          ),
        ),
      );

      if (widget.currentIndex == i) {
        children.add(
          Container(
            padding: const EdgeInsets.all(1),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: defaultBorderRadius,
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
              ),
            ),
            child: child,
          ),
        );
      } else {
        children.add(
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: child,
          ),
        );
      }
    }
    return Column(children: children);
  }
}
