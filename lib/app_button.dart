import 'package:flutter/material.dart';

enum ButtonType { filled, online }

class AppButton extends StatelessWidget {
  final Color backgroundColor;
  final String label;
  final Color labelColor;
  final VoidCallback onPressed;
  final ButtonType type;

  const AppButton({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
    required this.onPressed,
    this.type = ButtonType.filled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: type == ButtonType.filled ? backgroundColor : Colors.transparent,
        side: type == ButtonType.online ? BorderSide(color: Colors.blue) : null,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(label, style: TextStyle(color: labelColor)),
    );
  }
}
