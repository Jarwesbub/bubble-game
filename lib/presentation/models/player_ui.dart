import 'package:bubble_game/domain/entities/bubble.dart';
import 'package:bubble_game/presentation/widgets/player_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/player.dart';

class PlayerUI {
  final Player player;
  final RxInt lane;
  final RxDouble size;
  final RxList<Bubble> bubbles;
  PlayerUI(this.player)
    : lane = player.lane.obs,
      size = 40.0.obs,
      bubbles = RxList();

  void syncFromDomain() {
    lane.value = player.lane;
  }

  void updateSize(double newSize) {
    size.value = newSize;
  }

  // Build method returns widget dynamically
  Widget build() {
    return PlayerWidget(size: size);
  }
}
