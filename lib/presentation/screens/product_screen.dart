import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ebs/domain/bloc/id_product/id_product_bloc.dart';
import 'package:test_ebs/presentation/widgets/star.dart';
import 'package:test_ebs/utils/colors.dart';
import 'package:test_ebs/utils/methods.dart';
import 'package:test_ebs/presentation/widgets/bottom_add_widget.dart';
import 'package:test_ebs/presentation/widgets/product_parametrs.dart';

@RoutePage()
class ProductPage extends StatefulWidget {
  final id;
  const ProductPage({super.key, required this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late IdProductBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = IdProductBloc(widget.id);
    _bloc.add(LoadIdProduct()); // Передаем id в IdProductBloc при инициализации
  }

  @override
  Widget build(BuildContext context) {
    double width = ScreenSize.screenWidth(context);
    double widthPadding = width / 23.4375;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                BlocBuilder<IdProductBloc, IdProductState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is IdProductLoaded) {
                        final image = state.productId.mainImage;

                        return AppBarImage(
                          image: image,
                        );
                      }
                      return SliverToBoxAdapter(
                        child: SizedBox(height: 10),
                      );
                    }),
                SliverToBoxAdapter(
                  child: SizedBox(height: widthPadding),
                ),
                // NameProduct(
                //   title: name,
                // ),
                BlocBuilder<IdProductBloc, IdProductState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is IdProductLoaded) {
                        final size = state.productId.size;
                        final color = state.productId.colour;

                        return SliverToBoxAdapter(
                            child: ProductParametrs(
                          size: size,
                          color: color,
                        ));
                      }
                      return const SliverToBoxAdapter(child: SizedBox());
                    }),
                BlocBuilder<IdProductBloc, IdProductState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is IdProductLoaded) {
                        final details = state.productId.details;

                        return DetailsWidget(
                          details: details,
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox());
                    }),
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
                BlocBuilder<IdProductBloc, IdProductState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is IdProductLoaded) {
                        final reviewsList = state.productId.reviews;
                        return SliverList.builder(
                          itemBuilder: (context, index) {
                            final firstName = reviewsList[index].firstName;
                            final lastName = reviewsList[index].lastName;
                            final message = reviewsList[index].message;
                            final image = reviewsList[index].image;
                            final rating = reviewsList[index].rating;
                            List<Widget> stars =
                                List.generate(rating!, (index) => Star());
                            return Padding(
                              padding: EdgeInsets.only(
                                  top: 32,
                                  left: widthPadding,
                                  right: widthPadding),
                              child: Container(
                                width: double.infinity,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 46,
                                        height: 46,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primaryColor,
                                        ),
                                        child: ClipOval(
                                          child: Image.network(
                                            image!,
                                            fit: BoxFit
                                                .cover, // Устанавливаем, чтобы изображение заполняло весь круг
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 32,
                                        ),
                                        child: Container(
                                          width: 265,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('$firstName $lastName'),
                                                  Row(
                                                    children: stars,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Text(message!)
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            );
                          },
                          itemCount: reviewsList!.length,
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
                    }),
                // const SliverToBoxAdapter(
                //   child: SizedBox(
                //     height: 112,
                //   ),
                // )
              ],
            ),
            BottomAdd(theme: theme),
          ],
        ),
      ),
    );
  }
}

class NameProduct extends StatelessWidget {
  final title;

  const NameProduct({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    double width = ScreenSize.screenWidth(context);
    double widthPadding = width / 23.4375;
    final theme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: widthPadding, left: widthPadding, right: widthPadding),
        child: Text(
          title,
          style: theme.titleMedium,
        ),
      ),
    );
  }
}

class AppBarImage extends StatelessWidget {
  final image;
  const AppBarImage({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 480,
      pinned: false,
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
            icon: SvgPicture.asset(
              'images/Rate.svg',
              width: 40,
              height: 40,
            ),
            color: textBlacColor // Цвет кнопки
            ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: Image(image: NetworkImage(image), fit: BoxFit.cover),
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  final details;
  const DetailsWidget({
    super.key,
    this.details,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    double width = ScreenSize.screenWidth(context);
    double widthPadding = width / 23.4375;
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
          Text(details),
          SizedBox(
            height: 8,
          ),
          Text('Read More', style: theme.headlineMedium)
        ]),
      ),
    );
  }
}
