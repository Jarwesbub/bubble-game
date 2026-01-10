import 'package:flutter/material.dart';

class HelperWidget extends StatelessWidget {
  const HelperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      color: Colors.grey,
    );
  }
}
