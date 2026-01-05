import 'package:bubble_game/presentation/routes/app_routes.dart';
import 'package:bubble_game/presentation/widgets/menu_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(flex: 2, child: Center(child: Text('Bubble Game'))),
          Expanded(
            flex: 3,
            child: Column(
              spacing: 30,
              children: [
                MenuButtonWidget(
                  title: 'Start',
                  onPressed: () {
                    Get.toNamed(AppRoutes.game);
                  },
                ),
                MenuButtonWidget(title: 'Quit', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
