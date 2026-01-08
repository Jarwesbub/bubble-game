import 'package:bubble_game/presentation/controllers/game_controller.dart';
import 'package:bubble_game/presentation/widgets/bubble_widget.dart';

class Bubble {
  final BubbleColorType type;
  final BubbleWidget widget;

  Bubble({required this.type, required this.widget});
}
