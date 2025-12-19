import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String hintText;
  final Color borderColor;

  const AppInput({
    Key? key,
    this.hintText = '',
    this.borderColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
      ),
    );
  }
}
