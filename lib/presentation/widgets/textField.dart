import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextInputType textInputType;

  const TextFieldInput({
    super.key,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        fillColor: fieldColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45), // Закругление границы
          borderSide:
              BorderSide.none, // Убираем границу, оставляя только закругления
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(45), // Закругление границы при фокусе
          borderSide:
              BorderSide.none, // Убираем границу, оставляя только закругления
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(12),
      ),
      keyboardType: textInputType,
    );
  }
}
