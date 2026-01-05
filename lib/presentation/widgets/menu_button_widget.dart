import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {onPressed()},
      child: Container(
        width: 200,
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(fontSize: 28)),
      ),
    );
  }
}
