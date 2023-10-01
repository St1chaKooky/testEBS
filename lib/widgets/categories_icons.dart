import 'package:flutter/material.dart';
import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/screen_size.dart';

// ignore: must_be_immutable
class IconSVG extends StatelessWidget {
  String title;
  String svg;
  IconSVG({super.key, required this.svg, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    double width = ScreenSize.screenWidth(context);
    double widthPadding = width / 23.4375;
    return Row(
      children: [
        SizedBox(
          width: widthPadding,
        ),
        Container(
          width: 65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: shodowColor,
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.network(
                    svg,
                    width: 27,
                    height: 27,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Flexible(
                child: Text(
                  title,
                  style: theme.bodySmall,
                  textAlign: TextAlign.center, // Выравнивание по центру
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
