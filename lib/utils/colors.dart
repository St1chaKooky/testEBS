import 'package:flutter/material.dart';

final primaryColor = Color(hexColor('00C569'));
final backgroundColor = Color(hexColor('FFFFFF'));
final shodowColor = Color(hexColor('F4F4F4'));
final fieldColor = Color(hexColor('F7F7F7'));
final textBlacColor = Color(hexColor('000000'));
final textGreyColor = Color(hexColor('929292'));
final borederColor = Color(hexColor('EBEBEB'));
final selectProductColor = Color(hexColor('2F3135'));

int hexColor(String color) {
  String newColor = '0xff$color';
  int finalColor = int.parse(newColor);
  return finalColor;
}
