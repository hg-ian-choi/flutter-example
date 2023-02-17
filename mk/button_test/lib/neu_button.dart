import 'package:flutter/material.dart';

class NeuButton extends StatelessWidget {
  NeuButton({Key? key, required this.onTap, required this.isButtonPressed}) : super(key: key);

  final onTap;
  bool isButtonPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isButtonPressed ? Colors.grey.shade200 : Colors.grey.shade300,
          ),
          boxShadow: isButtonPressed
              ? [
                  // No shadows if button is pressed
                ]
              : [
                  // darker shadow on bottom right
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(6, 6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-6, -6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: Icon(
          Icons.favorite,
          size: 60,
          color: isButtonPressed ? Colors.red.shade200 : Colors.red.shade400,
        ),
      ),
    );
  }
}
