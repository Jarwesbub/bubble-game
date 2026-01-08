import 'package:bubble_game/presentation/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamePage extends GetView<GameController> {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            const SizedBox(height: 30), // Empty padding.
            AspectRatio(
              aspectRatio: 0.557,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.black12,
                ),
                child: Stack(children: [_bubbleRow()]),
              ),
            ),
            AspectRatio(
              aspectRatio: 2,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.black26,
                    ),
                    child: _playerRow(),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: controller.onButtonPressTest,
                      child: Text('Test'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bubbleRow() {
    final length = controller.bubbles.length;
    return Row(
      children: List.generate(length, (index) {
        return Expanded(child: _bubbleColumn(index));
      }),
    );
  }

  Widget _bubbleColumn(int rowIndex) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45, width: 0.5),
          color: Colors.black12,
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: controller.bubbles[rowIndex].length,
          itemBuilder: (context, columnIndex) {
            final bubble = controller.bubbles[rowIndex][columnIndex];
            return AspectRatio(aspectRatio: 1, child: bubble);
          },
        ),
      );
    });
  }

  Widget _playerRow() {
    final length = controller.bubbles.length;
    return Row(
      children: List.generate(length, (_) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45, width: 0.5),
              color: Colors.black12,
            ),
          ),
        );
      }),
    );
  }
}
