import 'package:bubble_game/presentation/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamePage extends GetView<GameController> {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [const Text('Game Page'), Obx(() => _testButton())],
      ),
    );
  }

  Widget _testButton() {
    return ElevatedButton(
      onPressed: controller.onButtonPress,
      child: Text('Num: ${controller.num.value}'),
    );
  }
}
