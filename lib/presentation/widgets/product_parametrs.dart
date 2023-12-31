import 'package:flutter/material.dart';
import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/methods.dart';

class ProductParametrs extends StatefulWidget {
  final size;
  final color;
  const ProductParametrs({super.key, this.size, this.color});

  @override
  State<ProductParametrs> createState() => _ProductParametrsState();
}

class _ProductParametrsState extends State<ProductParametrs> {
  @override
  Widget build(BuildContext context) {
    double width = ScreenSize.screenWidth(context);
    double widthPadding = width / 23.4375;
    double height = ScreenSizeHeight.screenWidth(context);
    double heightParametr = height / 20.3;
    double widthParametr = width / 2.34375;

    final theme = Theme.of(context).textTheme;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            right: widthPadding, left: widthPadding, top: 28 - widthPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Parametr(
              size: widget.size,
              widthParametr: widthParametr,
              heightParametr: heightParametr,
              theme: theme,
              widthPadding: widthPadding,
            ),
            _ParametrColor(
              color: widget.color,
              widthParametr: widthParametr,
              heightParametr: heightParametr,
              theme: theme,
              widthPadding: widthPadding,
            )
          ],
        ),
      ),
    );
  }
}

class _ParametrColor extends StatelessWidget {
  final color;
  const _ParametrColor({
    super.key,
    required this.widthParametr,
    required this.heightParametr,
    required this.theme,
    required this.widthPadding,
    this.color,
  });
  final double widthPadding;

  final double widthParametr;
  final double heightParametr;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widthParametr,
        height: heightParametr,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: borederColor, // Цвет обводки
            width: 1.0, // Ширина обводки
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: widthPadding),
              child: Text(
                'Color',
                style: theme.headlineSmall,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: widthPadding),
                child: Text(
                  color,
                  style: theme.bodyLarge,
                )
                // Container(
                //   width: 20,
                //   height: 20,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(8),
                //       color: selectProductColor),
                // )
                )
          ],
        ));
  }
}

class _Parametr extends StatelessWidget {
  final size;
  const _Parametr({
    super.key,
    required this.widthParametr,
    required this.heightParametr,
    required this.theme,
    required this.widthPadding,
    this.size,
  });
  final double widthPadding;

  final double widthParametr;
  final double heightParametr;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widthParametr,
        height: heightParametr,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: borederColor, // Цвет обводки
            width: 1.0, // Ширина обводки
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: widthPadding),
              child: Text(
                'Size',
                style: theme.headlineSmall,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: widthPadding),
              child: Text(
                truncateString(size, 10),
                style: theme.bodyLarge,
              ),
            )
          ],
        ));
  }

  String truncateString(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength) + '...';
  }
}
