import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ebs/utils/colors.dart';

// ignore: must_be_immutable
class IconSVG extends StatelessWidget {
  String title;
  String svg;
  IconSVG({super.key, required this.svg, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 90,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: shodowColor, // Цвет и прозрачность тени
                  spreadRadius: 1, // Распространение тени
                  blurRadius: 20, // Радиус размытия тени
                  offset: Offset(
                      0, 6), // Смещение тени (горизонтально, вертикально)
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                svg,
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(title)
        ],
      ),
    );
  }
}
