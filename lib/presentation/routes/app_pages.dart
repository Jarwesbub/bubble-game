import 'package:bubble_game/presentation/bindings/game_bindings.dart';
import 'package:bubble_game/presentation/routes/app_routes.dart';
import 'package:bubble_game/presentation/bindings/menu_bindings.dart';
import 'package:bubble_game/presentation/pages/game_page.dart';
import 'package:bubble_game/presentation/pages/main_menu_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.mainMenu,
      page: () => const MainMenuPage(),
      binding: MenuBindings(),
    ),
    GetPage(
      name: AppRoutes.game,
      page: () => GamePage(),
      binding: GameBindings(),
    ),
  ];
}
