import 'dart:math';

import 'package:bubble_game/presentation/controllers/auth_controller.dart';
import 'package:bubble_game/presentation/widgets/bubble_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BubbleColorType { red, blue, green, yellow }

class GameController extends AuthController {
  static const int bubbleRows = 6;
  static const int maxBubbles = 11;
  List<RxList<BubbleWidget>> bubbles = [];

  GameController() {
    bubbles = RxList.generate(bubbleRows, (_) {
      // Init bubble matrix.
      return RxList<BubbleWidget>();
    });
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    // Create bubble rows for testing.
    for (int i = 0; i < bubbleRows; i++) {
      final count = Random().nextInt(4) + 2;
      bubbles[i].addAll(await _generateTestBubbles(count));
    }
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  Future<RxList<BubbleWidget>> _generateTestBubbles(int count) async {
    final bubbleList = RxList.generate(count, (index) {
      final rand = Random().nextInt(BubbleColorType.values.length);
      final type = BubbleColorType.values[rand];
      return _getBubbleByType(type);
    });
    return bubbleList;
  }

  BubbleWidget _getBubbleByType(BubbleColorType type) {
    final color = switch (type) {
      BubbleColorType.red => Colors.red,
      BubbleColorType.blue => Colors.blue,
      BubbleColorType.green => Colors.green,
      BubbleColorType.yellow => Colors.yellow,
    };
    return BubbleWidget(color: color);
  }

  void onButtonPressTest() {
    // Random row number.
    final row = Random().nextInt(bubbleRows);

    if (bubbles[row].length >= maxBubbles) {
      print('Max bubbles reached in a row $row');
      return;
    }
    // Choose random color type.
    final rand = Random().nextInt(BubbleColorType.values.length);
    final type = BubbleColorType.values[rand];
    bubbles[row].add(_getBubbleByType(type));
  }
}
