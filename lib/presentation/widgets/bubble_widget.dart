import 'package:bubble_game/domain/enums/bubble_color_type.dart';
import 'package:bubble_game/domain/enums/bubble_type.dart';
import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  const BubbleWidget({super.key, required this.colorType, required BubbleType type});
  final BubbleColorType colorType;

  Color get _color {
    switch (colorType) {
      case BubbleColorType.red:
        return Colors.red;
      case BubbleColorType.blue:
        return Colors.blue;
      case BubbleColorType.green:
        return Colors.green;
      case BubbleColorType.yellow:
        return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
