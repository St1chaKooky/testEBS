import 'package:flutter/material.dart';
import 'package:test_ebs/utils/colors.dart';

final baseTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: backgroundColor, // Укажите желаемый цвет AppBar
  ),
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  textTheme: TextTheme(
    titleLarge: TextStyle(
        fontSize: 18, color: primaryColor, fontWeight: FontWeight.w700),
    titleMedium: TextStyle(
        fontSize: 26, color: textBlacColor, fontWeight: FontWeight.w700),
    titleSmall: TextStyle(
        fontSize: 18, color: textBlacColor, fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(
        fontSize: 14, color: textBlacColor, fontWeight: FontWeight.w400),
    headlineMedium: TextStyle(
        fontSize: 14, color: primaryColor, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(
        fontSize: 14, color: textBlacColor, fontWeight: FontWeight.w700),
    bodyMedium: TextStyle(
        fontSize: 16, color: textBlacColor, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(
        fontSize: 12, color: textBlacColor, fontWeight: FontWeight.w400),
    labelLarge: TextStyle(
        fontSize: 14, color: backgroundColor, fontWeight: FontWeight.w400),
    labelMedium: TextStyle(
        fontSize: 16, color: primaryColor, fontWeight: FontWeight.w400),
    labelSmall: TextStyle(
        fontSize: 12, color: textGreyColor, fontWeight: FontWeight.w400),
  ),
);
