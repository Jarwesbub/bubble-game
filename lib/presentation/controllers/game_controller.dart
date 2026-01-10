import 'dart:math';

import 'package:bubble_game/core/logger.dart';
import 'package:bubble_game/domain/enums/bubble_color_type.dart';
import 'package:bubble_game/domain/entities/player.dart';
import 'package:bubble_game/domain/enums/bubble_type.dart';
import 'package:bubble_game/presentation/controllers/auth_controller.dart';
import 'package:bubble_game/domain/entities/bubble.dart';
import 'package:bubble_game/presentation/models/player_ui.dart';
import 'package:get/get.dart';

class GameController extends AuthController {
  static const int lanesCount = 6;
  static const int maxBubbles = 11; // Max bubbles per lane.
  final Player _player = Player(lane: 0);
  final heldBubbles = RxList<Bubble>();
  late final PlayerUI playerUI = PlayerUI(_player);

  List<RxList<Bubble>> bubbles = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    bubbles = RxList.generate(lanesCount, (_) {
      // Init bubble matrix.
      return RxList<Bubble>();
    });

    /*
    // Create bubble rows for testing.
    for (int i = 0; i < lanesCount; i++) {
      final count = Random().nextInt(4) + 2;
      bubbles[i].addAll(await _generateBaseBubbles(count));
    }
    */

    _spawnPlayerBubbles();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  BubbleColorType _getRandomBubbleColorType() {
    final rand = Random().nextInt(BubbleColorType.values.length);
    return BubbleColorType.values[rand];
  }

  void _spawnPlayerBubbles() {
    heldBubbles.value = List.generate(2, (_) {
      final colorType = _getRandomBubbleColorType();
      return Bubble(type: BubbleType.normal, colorType: colorType);
    });
    playerUI.bubbles.value = heldBubbles;
    logger.d('Player children count: ${playerUI.bubbles.length}');
  }

  // UI Actions.

  void onPlayerThrow() {
    if (bubbles[_player.lane].length >= maxBubbles) {
      logger.d('Max bubbles reached in a row ${_player.lane}');
      return;
    }
    for (final bubble in heldBubbles) {
      bubbles[_player.lane].add(
        Bubble(colorType: bubble.colorType, type: BubbleType.normal),
      );
    }
    _spawnPlayerBubbles();
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
