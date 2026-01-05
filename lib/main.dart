import 'package:bubble_game/presentation/bindings/app_bindings.dart';
import 'package:bubble_game/presentation/routes/app_pages.dart';
import 'package:bubble_game/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const StartUp());
}

class StartUp extends StatelessWidget {
  const StartUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bubble Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.mainMenu,
      getPages: AppPages.pages,
    );
  }
}
