import 'package:bubble_game/domain/enums/bubble_color_type.dart';
import 'package:bubble_game/domain/enums/bubble_type.dart';

class Bubble {
  BubbleType type;

  BubbleColorType colorType;

  Bubble({required this.type, required this.colorType});
}
