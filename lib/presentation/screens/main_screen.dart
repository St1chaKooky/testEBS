import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ebs/domain/api/api.dart';
import 'package:test_ebs/domain/bloc/category_bloc/category_bloc.dart';
import 'package:test_ebs/domain/bloc/id_product_for_sell/id_product_bloc.dart';

import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/methods.dart';
import 'package:test_ebs/presentation/widgets/card_product.dart';
import 'package:test_ebs/presentation/widgets/categories_icons.dart';
import 'package:test_ebs/presentation/widgets/textField.dart';

import '../../domain/bloc/product_more_bloc/product_bloc_bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _blocCategory = CategoryBloc(ApiCategories());
  final _blocProduct = ProductBloc(ApiProduct());
  final _blocBestProduct = IdProductSellBloc();

  @override
  void initState() {
    super.initState();
    _blocCategory.add(LoadCategory());
    _blocProduct.add(LoadProduct());
    _blocBestProduct.add(LoadIdProduct());
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
                      const Expanded(
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'images/camera.svg',
                          ),
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
          BlocBuilder<IdProductSellBloc, IdProductState>(
            bloc: _blocBestProduct,
            builder: (context, state) {
              if (state is IdProductLoaded) {
                final productIdList = state.productIdList;
                return SliverToBoxAdapter(
                  child: Container(
                      height: 337,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final name = productIdList[index].name!;
                          final leading = productIdList[index].details!;
                          final price = productIdList[index].price!;
                          final id = productIdList[index].id!;
                          final image = productIdList[index].mainImage!;

                          return CardWidget(
                            id: id,
                            src: image,
                            leading: leading,
                            name: name,
                            price: price,
                          );
                        },
                        itemCount: productIdList.length,
                      )),
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: 14,
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
                    List<Widget> row = [];
                    if (index % 2 != 0) {
                      final product1 = results[index - 1];
                      final product2 = results[index];
                      final name1 =
                          MethodTitle().truncateString(product1.name!, 20);
                      final name2 =
                          MethodTitle().truncateString(product2.name!, 20);
                      final leading1 =
                          MethodTitle().truncateString(product1.details!, 20);
                      final leading2 =
                          MethodTitle().truncateString(product2.details!, 20);
                      final price1 = product1.price;
                      final price2 = product2.price;
                      final id1 = product1.id;
                      final id2 = product2.id;

                      row.add(CardWidget(
                        id: id1!,
                        src: product1.mainImage!,
                        leading: leading1,
                        name: name1,
                        price: price1!,
                      ));
                      row.add(CardWidget(
                        id: id2!,
                        src: product2.mainImage!,
                        leading: leading2,
                        name: name2,
                        price: price2!,
                      ));
                    } else if (index >= 0 && index < results.length) {
                      final product1 = results[index];
                      final name1 =
                          MethodTitle().truncateString(product1.name!, 20);
                      final price1 = product1.price;
                      final leading1 =
                          MethodTitle().truncateString(product1.details!, 20);
                      final id1 = product1.id;

                      if ((results.length % 2 != 0) &&
                          index == results.length - 1) {
                        row.add(CardWidget(
                          id: id1!,
                          src: product1.mainImage!,
                          leading: leading1,
                          name: name1,
                          price: price1!,
                        ));
                      }
                    }
                    return Column(
                      children: [
                        Row(
                          children: row,
                        ),
                        const SizedBox(
                          height: 14,
                        )
                      ],
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
