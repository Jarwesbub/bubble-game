import 'dart:math';

import 'package:bubble_game/domain/entities/player.dart';
import 'package:bubble_game/presentation/controllers/auth_controller.dart';
import 'package:bubble_game/presentation/models/bubble_ui.dart';
import 'package:bubble_game/presentation/models/player_ui.dart';
import 'package:bubble_game/presentation/widgets/bubble_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BubbleColorType { red, blue, green, yellow }

class GameController extends AuthController {
  static const int lanesCount = 6;
  static const int maxBubbles = 11; // Max bubbles per lane.
  late final Player _player;
  late final PlayerUI playerUI;

  List<RxList<BubbleUI>> bubbles = [];

  GameController() {
    bubbles = RxList.generate(lanesCount, (_) {
      // Init bubble matrix.
      return RxList<BubbleUI>();
    });
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    _player = Player(lane: 0);
    playerUI = PlayerUI(_player);
    // Create bubble rows for testing.
    for (int i = 0; i < lanesCount; i++) {
      final count = Random().nextInt(4) + 2;
      bubbles[i].addAll(await _generateTestBubbles(count));
    }
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  Future<RxList<BubbleUI>> _generateTestBubbles(int count) async {
    final bubbleList = RxList.generate(count, (index) {
      final rand = Random().nextInt(BubbleColorType.values.length);
      final type = BubbleColorType.values[rand];
      final widget = _getBubbleWidgetByType(type);
      return BubbleUI(type: type, widget: widget);
    });
    return bubbleList;
  }

  BubbleWidget _getBubbleWidgetByType(BubbleColorType type) {
    final color = switch (type) {
      BubbleColorType.red => Colors.red,
      BubbleColorType.blue => Colors.blue,
      BubbleColorType.green => Colors.green,
      BubbleColorType.yellow => Colors.yellow,
    };
    return BubbleWidget(color: color);
  }

  void onPlayerThrow() {
    // Random row number.
    final lane = _player.lane;

    if (bubbles[lane].length >= maxBubbles) {
      print('Max bubbles reached in a row $lane');
      return;
    }
    // Choose random color type.
    final rand = Random().nextInt(BubbleColorType.values.length);
    final type = BubbleColorType.values[rand];
    final widget = _getBubbleWidgetByType(type);
    bubbles[lane].add(BubbleUI(type: type, widget: widget));
  }

  void onMoveLeft() {
    _player.moveLeft();
    playerUI.syncFromDomain();
  }

  void onMoveRight() {
    _player.moveRight(lanesCount);
    playerUI.syncFromDomain();
  }
}
