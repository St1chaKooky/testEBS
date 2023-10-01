import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ebs/api/api.dart';
import 'package:test_ebs/bloc/category_bloc.dart';
import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/screen_size.dart';
import 'package:test_ebs/widgets/card_product.dart';
import 'package:test_ebs/widgets/categories_icons.dart';
import 'package:test_ebs/widgets/textField.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _blocCategory = CategoryBloc(ApiCategories());
  @override
  void initState() {
    super.initState();
    _blocCategory.add(LoadCategory());
  }

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
          BlocBuilder<CategoryBloc, CategoryState>(
            bloc: _blocCategory,
            builder: (context, state) {
              if (state is CategoryLoaded) {
                final categoryLenght = state.categoryModel.count;
                final listCategories = state.categoryModel.results;
                return SliverToBoxAdapter(
                  child: Container(
                    height: 95,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryLenght,
                        itemBuilder: (context, index) {
                          final title =
                              truncateString(listCategories![index].name!);
                          return IconSVG(
                            svg: listCategories[index].icon!,
                            title: title,
                          );
                        }),
                  ),
                );
              }
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: primaryColor,
                  ),
                ),
              );
            },
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

  String truncateString(String input) {
    final List<String> delimiters = [' ', '&', ','];
    int minIndex = input.length;

    for (final delimiter in delimiters) {
      final index = input.indexOf(delimiter);
      if (index != -1 && index < minIndex) {
        minIndex = index;
      }
    }

    return input.substring(0, minIndex);
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
