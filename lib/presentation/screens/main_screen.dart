import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ebs/domain/api/api.dart';
import 'package:test_ebs/domain/bloc/category_bloc/category_bloc.dart';

import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/methods.dart';
import 'package:test_ebs/presentation/widgets/card_product.dart';
import 'package:test_ebs/presentation/widgets/categories_icons.dart';
import 'package:test_ebs/presentation/widgets/textField.dart';

import '../../domain/bloc/product_bloc/product_bloc_bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _blocCategory = CategoryBloc(ApiCategories());
  final _blocProduct = ProductBloc(ApiProduct());

  @override
  void initState() {
    super.initState();
    _blocCategory.add(LoadCategory());
    _blocProduct.add(LoadProduct());
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
              padding: EdgeInsets.only(
                  top: 44, left: widthPadding, right: widthPadding),
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: 337,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardWidget(
                    leading: 'asasa',
                    name: 'ASasaASSA',
                    price: '645',
                  ),
                  itemCount: 4,
                )),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 44,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                left: widthPadding,
              ),
              child: Text(
                'More to Explore',
                style: theme.titleSmall,
              ),
            ),
          ),
          BlocBuilder<ProductBloc, ProductBlocState>(
            bloc: _blocProduct,
            builder: (context, state) {
              if (state is ProductLoaded) {
                final results = state.products.results!;
                return SliverList.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final product = results[index];
                    final name = product.name ??
                        "No Name"; // Замените "No Name" на значение по умолчанию
                    return CardWidget(
                      leading: 'dsds',
                      name: name,
                      price: 'sasa',
                    );
                  },
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
