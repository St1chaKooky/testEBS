import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/screen_size.dart';
import 'package:test_ebs/widgets/card_product.dart';
import 'package:test_ebs/widgets/categories_icons.dart';
import 'package:test_ebs/widgets/textField.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double width = ScreenSize.screenWidth(context);
    double widthPadding = width / 23.4375;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: backgroundColor,
            foregroundColor: backgroundColor,
            pinned: false,
            floating: false,
            backgroundColor: backgroundColor,
            elevation: 0,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: widthPadding,
                      right: widthPadding,
                      top: 30,
                      bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFieldInput(
                          textInputType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: SvgPicture.asset(
                            'images/camera.svg',
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 28,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: widthPadding, bottom: 18),
              child: Text(
                'Categories',
                style: theme.titleSmall,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: widthPadding,
                  ),
                  IconSVG(
                    svg: 'images/men.svg',
                    title: 'Men',
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  IconSVG(
                    svg: 'images/women.svg',
                    title: 'Women',
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  IconSVG(
                    svg: 'images/devices.svg',
                    title: 'Devices',
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  IconSVG(
                    svg: 'images/gadgets.svg',
                    title: 'Gadgets',
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  IconSVG(
                    svg: 'images/gaming.svg',
                    title: 'Gaming',
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 44, horizontal: widthPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Selling',
                        style: theme.titleSmall,
                      ),
                      Text('See all', style: theme.bodyMedium),
                    ],
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CardWidget(),
                      CardWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: widthPadding, bottom: 28),
              child: Text(
                'More to Explore',
                style: theme.titleSmall,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: widthPadding),
            sliver: SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) => const MoreToExploreWidget(),
            ),
          )
        ],
      ),
    );
  }
}

class MoreToExploreWidget extends StatelessWidget {
  const MoreToExploreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardWidget(),
          CardWidget(),
        ],
      ),
    );
  }
}
