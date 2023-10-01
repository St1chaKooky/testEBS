import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_ebs/router/navigation_bar.dart';
import 'package:test_ebs/presentation/screens/account_screen.dart';
import 'package:test_ebs/presentation/screens/baskets_screen.dart';
import 'package:test_ebs/presentation/screens/main_screen.dart';
import 'package:test_ebs/presentation/screens/product_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: NavigationBarRoute.page, path: '/', children: [
          AutoRoute(
            page: MainRoute.page,
            path: 'main',
          ),
          AutoRoute(
            page: BasketRoute.page,
            path: 'basket',
          ),
          AutoRoute(
            page: AccountRoute.page,
            path: 'account',
          ),
        ]),
        AutoRoute(
          page: ProductRoute.page,
          path: '/product',
        ),
      ];
}
