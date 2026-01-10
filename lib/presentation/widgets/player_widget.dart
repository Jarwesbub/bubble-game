import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({super.key, required this.size});
  final RxDouble size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.value,
          height: size.value,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
