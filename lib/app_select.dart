import 'package:flutter/material.dart';

class AppSelect extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;
  final String hint;
  final ValueChanged<String?> onChanged;

  const AppSelect({
    Key? key,
    required this.options,
    this.selectedValue,
    required this.onChanged,
    this.hint = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
      ),
      items: options
          .map((opt) => DropdownMenuItem<String>(
        value: opt,
        child: Text(opt),
      ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
