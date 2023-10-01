import 'package:flutter/material.dart';
import 'package:test_ebs/presentation/screens/product_screen.dart';
import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/methods.dart';

class CardWidget extends StatelessWidget {
  final int id;
  final String name;
  final String leading;
  final double price;
  final String src;

  const CardWidget(
      {super.key,
      required this.src,
      required this.leading,
      required this.name,
      required this.price,
      required this.id});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    double width = ScreenSize.screenWidth(context);
    double heightPicture = width / 1.5625;
    double widthPicture = width / 2.28;
    double widthPadding = width / 23.4375;

    return Row(
      children: [
        SizedBox(
          width: widthPadding,
        ),
        InkWell(
          highlightColor: backgroundColor,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductPage()),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: widthPicture,
                  height: heightPicture,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(src),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: theme.bodyMedium,
                ),
                Text(
                  '$leading...',
                  style: theme.labelSmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '\$${price.toInt()}',
                  style: theme.labelMedium,
                )
              ]),
        ),
      ],
    );
  }
}
