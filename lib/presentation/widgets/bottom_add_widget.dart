import 'package:flutter/material.dart';
import 'package:test_ebs/utils/colors.dart';

class BottomAdd extends StatelessWidget {
  const BottomAdd({
    super.key,
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0, // Прикрепляем виджет к нижней части экрана
      left: 0, // Можете настроить горизонтальное выравнивание
      right: 0, // Можете настроить горизонтальное выравнивание
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PRICE',
                  style: theme.labelSmall,
                ),
                SizedBox(height: 2),
                Text(
                  '\$1500',
                  style: theme.titleLarge,
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                  width: 146,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: primaryColor),
                  child: Center(
                    child: Text(
                      'ADD',
                      style: theme.labelLarge,
                    ),
                  )),
            )
          ]),
        ),

        width: double.infinity,
        height: 84, // Высота вашего виджета
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: shodowColor, // Цвет и прозрачность тени
              spreadRadius: 0, // Радиус размытия тени
              blurRadius: 20, // Радиус размытия тени
              offset:
                  Offset(0, -1), // Смещение тени (горизонтально, вертикально)
            ),
          ],
        ),
      ),
    );
  }
}
