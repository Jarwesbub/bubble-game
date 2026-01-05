import 'package:bubble_game/presentation/controllers/game_controller.dart';
import 'package:get/get.dart';

// Bindings when the game is running.

class GameBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController());
  }
}
