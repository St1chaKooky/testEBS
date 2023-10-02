import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_ebs/domain/bloc/cart_bloc/cart_bloc.dart';

import 'package:test_ebs/models/hive_model.dart';
import 'package:test_ebs/presentation/widgets/card_product.dart';

import 'package:test_ebs/utils/methods.dart';

@RoutePage()
class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  var results;
  @override
  void initState() {
    super.initState();
    results = []; // Инициализируйте results пустым списком
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: SizedBox(
          height: 50,
        )),
        SliverToBoxAdapter(
          child: Center(
              child: Text(
            'Моя корзина',
            style: theme.titleMedium,
          )),
        ),
        // SliverToBoxAdapter(
        //   child: Center(
        //       child: ElevatedButton(
        //     child: Text('Обновить корзину'),
        //     onPressed: () => setState(() async {
        //       Hive.initFlutter();
        //       if (!Hive.isAdapterRegistered(0)) {
        //         Hive.registerAdapter(ProductAdapter());
        //       }
        //       var box = await Hive.openBox<ProductHive>('MyCart');
        //       final productsInCart = box.values.toList();
        //       results = productsInCart;
        //     }),
        //   )),
        // ),
        // SliverList.builder(
        //   itemCount: results.length,
        //   itemBuilder: (context, index) {
        //     List<Widget> row = [];
        //     if (index % 2 != 0) {
        //       final product1 = results[index - 1];
        //       final product2 = results[index];
        //       final name1 = MethodTitle().truncateString(product1.name!, 20);
        //       final name2 = MethodTitle().truncateString(product2.name!, 20);
        //       final leading1 =
        //           MethodTitle().truncateString(product1.leading!, 20);
        //       final leading2 =
        //           MethodTitle().truncateString(product2.leading!, 20);
        //       final price1 = product1.price;
        //       final price2 = product2.price;
        //       final id1 = product1.id;
        //       final id2 = product2.id;

        //       row.add(CardWidget(
        //         id: id1!,
        //         src: product1.imge!,
        //         leading: leading1,
        //         name: name1,
        //         price: price1!,
        //       ));
        //       row.add(CardWidget(
        //         id: id2!,
        //         src: product2.imge!,
        //         leading: leading2,
        //         name: name2,
        //         price: price2!,
        //       ));
        //     } else if (index >= 0 && index < results.length) {
        //       final product1 = results[index];
        //       final name1 = MethodTitle().truncateString(product1.name!, 20);
        //       final price1 = product1.price;
        //       final leading1 =
        //           MethodTitle().truncateString(product1.leading!, 20);
        //       final id1 = product1.id;

        //       if ((results.length % 2 != 0) && index == results.length - 1) {
        //         row.add(CardWidget(
        //           id: id1!,
        //           src: product1.imge!,
        //           leading: leading1,
        //           name: name1,
        //           price: price1!,
        //         ));
        //       }
        //     }
        //     return Column(
        //       children: [
        //         Row(
        //           children: row,
        //         ),
        //         const SizedBox(
        //           height: 14,
        //         )
        //       ],
        //     );
        //   },
        // )
      ],
    ));
  }
}
