import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_ebs/models/hive_model.dart';
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
  bool f = false;
  @override
  void initState() {
    super.initState();
    isLike().then((result) {
      if (mounted) {
        // Проверяем, что виджет все еще находится в дереве виджетов
        setState(() {
          f = result;
        });
      }
    });
  }

  Future<bool> isLike() async {
    Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ProductAdapter());
    }
    var box = await Hive.openBox<ProductHive>('MyCart');

    final productsInCart = box.values.toList();

    bool productExists =
        productsInCart.any((product) => product.id == widget.id);

    return !productExists;
  }

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
                Stack(alignment: AlignmentDirectional.topEnd, children: [
                  Container(
                    width: widthPicture,
                    height: heightPicture,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(widget.src),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          f = !f;
                        });
                        HiveModel(
                          id: widget.id,
                          name: widget.name,
                          leading: widget.leading,
                          price: widget.price,
                          imge: widget.src,
                        ).addProduct();
                      },
                      icon: f
                          ? SvgPicture.asset(
                              'images/Rate.svg',
                              width: 30,
                              height: 30,
                              // ignore: deprecated_member_use
                            )
                          : SvgPicture.asset(
                              'images/rateLike.svg',
                              width: 30,
                              height: 30,
                              // ignore: deprecated_member_use
                            ),
                      // Цвет кнопки
                    ),
                  ),
                ]),
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
