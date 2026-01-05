import 'package:bubble_game/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class GameController extends AuthController {
  final num = 0.obs;

  @override
  void dispose() {
    //
    super.dispose();
  }

  void onButtonPress() {
    num.value++;
  }
}
