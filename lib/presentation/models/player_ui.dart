import 'package:bubble_game/presentation/widgets/player_widget.dart';
import 'package:get/get.dart';
import '../../domain/entities/player.dart';

class PlayerUI {
  final Player player;
  final RxInt lane;
  late PlayerWidget widget = PlayerWidget(size: size);
  final size = RxDouble(40);

  PlayerUI(this.player) : lane = player.lane.obs;

  void syncFromDomain() {
    lane.value = player.lane;
  }

  void updateWidgetSize(double size) {
    this.size.value = size;
  }
}
