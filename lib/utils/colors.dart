import 'package:flutter/material.dart';

final primaryColor = Color(hexColor('00C569'));
final Color backgroundColor = Color(hexColor('FFFFFF'));
final shodowColor = Color(hexColor('F4F4F4'));
final fieldColor = Color(hexColor('F7F7F7'));
final textBlacColor = Color(hexColor('000000'));
final textGreyColor = Color(hexColor('929292'));
int hexColor(String color) {
  String newColor = '0xff$color';
  int finalColor = int.parse(newColor);
  return finalColor;
}
