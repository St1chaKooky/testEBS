import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_ebs/router/router.dart';
import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/methods.dart';

class CardWidget extends StatefulWidget {
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
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
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
          onTap: () {
            AutoRouter.of(context).push(ProductRoute(id: widget.id));
          },
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
                  child: Image.network(widget.src),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.name,
                  style: theme.bodyMedium,
                ),
                Text(
                  '${widget.leading}...',
                  style: theme.labelSmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '\$${widget.price.toInt()}',
                  style: theme.labelMedium,
                )
              ]),
        ),
      ],
    );
  }
}
