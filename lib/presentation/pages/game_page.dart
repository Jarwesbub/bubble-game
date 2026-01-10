import 'package:bubble_game/presentation/controllers/game_controller.dart';
import 'package:bubble_game/presentation/widgets/bubble_widget.dart';
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
                child: Stack(children: [_topView()]),
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
                    child: _bottomView(),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _moveLeftTestButton(),
                _throwButton(),
                _moveRightTestButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // All the bubbles.
  Widget _topView() {
    final length = controller.bubbles.length;
    // Create bubble rows that contains columns (matrix).
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
            final widget = BubbleWidget(
              colorType: bubble.colorType,
              type: bubble.type,
            );
            return AspectRatio(aspectRatio: 1, child: widget);
          },
        ),
      );
    });
  }

  Widget _bottomView() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnCount = controller.bubbles.length;
        final columnWidth = constraints.maxWidth / columnCount;

        return Stack(
          children: [_backgroundGrid(columnCount), _player(columnWidth)],
        );
      },
    );
  }

  Widget _throwButton() {
    return ElevatedButton(
      onPressed: controller.onPlayerThrow,
      child: Text('Throw'),
    );
  }

  Widget _moveLeftTestButton() {
    return ElevatedButton(onPressed: controller.onMoveLeft, child: Text('<'));
  }

  Widget _moveRightTestButton() {
    return ElevatedButton(onPressed: controller.onMoveRight, child: Text('>'));
  }

  Widget _backgroundGrid(int length) {
    return Row(
      children: List.generate(length, (_) {
        return Expanded(
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45, width: 0.5),
              color: Colors.black12,
            ),
          ),
        );
      }),
    );
  }

  Widget _player(double columnWidth) {
    controller.playerUI.size.value = columnWidth;
    return Obx(() {
      final left =
          controller.playerUI.lane * columnWidth +
          columnWidth / 2 -
          controller.playerUI.size / 2;

      return AnimatedPositioned(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        bottom: 0,
        left: left,
        child: Column(
          children: [
            ...List.generate(controller.playerUI.bubbles.length, (index) {
              final bubble = controller.playerUI.bubbles[index];
              return BubbleWidget(
                colorType: bubble.colorType,
                type: bubble.type,
              );
            }),
            controller.playerUI.build(),
          ],
        ),
      );
    });
  }
}
