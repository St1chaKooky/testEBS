import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/screen_size.dart';
import 'package:test_ebs/widgets/bottom_add_widget.dart';
import 'package:test_ebs/widgets/product_parametrs.dart';
import 'package:test_ebs/widgets/review_list.dart';

@RoutePage()
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizeHeight.screenWidth(context);
    double width = ScreenSize.screenWidth(context);
    double widthPadding = width / 23.4375;
    double heightPicture = height / 1.691;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(slivers: [
          AppBar(heightPicture: heightPicture),
          SliverToBoxAdapter(
            child: SizedBox(height: widthPadding),
          ),
          NameProduct(widthPadding: widthPadding, theme: theme),
          ProductParametrs(),
          DetailsWidget(widthPadding: widthPadding),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: widthPadding, top: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviews',
                    style: theme.titleSmall,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Write your', style: theme.headlineMedium),
                ],
              ),
            ),
          ),
          Reviews(widthPadding: widthPadding),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 112,
            ),
          )
        ]),
        BottomAdd(theme: theme),
      ]),
    );
  }
}

class NameProduct extends StatelessWidget {
  const NameProduct({
    super.key,
    required this.widthPadding,
    required this.theme,
  });

  final double widthPadding;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: widthPadding, left: widthPadding, right: widthPadding),
        child: Text(
          'Nike Dri-Fit Long Sleeve',
          style: theme.titleMedium,
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
    required this.heightPicture,
  });

  final double heightPicture;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 480,
      pinned: false,
      floating: false,
      collapsedHeight: 200,
      toolbarHeight: 200,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
        color: textBlacColor,
      ),
      actions: [
        IconButton(
            onPressed: () {
              // Обработчик для дополнительной кнопки
            },
            icon: SvgPicture.asset('images/Rate.svg'),
            color: textBlacColor // Цвет кнопки
            ),
      ],
      flexibleSpace: const FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background:
            Image(image: AssetImage('images/image.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.widthPadding,
  });

  final double widthPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: widthPadding,
          top: 36,
          right: widthPadding,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Details',
            style: theme.titleSmall,
          ),
          SizedBox(
            height: widthPadding,
          ),
          Text(
              'ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss'),
          SizedBox(
            height: 8,
          ),
          Text('Read More', style: theme.headlineMedium)
        ]),
      ),
    );
  }
}
