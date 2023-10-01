import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ebs/router/router.dart';
import 'package:test_ebs/utils/colors.dart';

@RoutePage()
class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        MainRoute(),
        BasketRoute(),
        AccountRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: backgroundColor,
            currentIndex: tabsRouter.activeIndex,
            elevation: 5,
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.blue,
            onTap: (index) => openPage(index, tabsRouter),
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(width: 60, height: 60, child: Icon(Icons.home)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/cart.svg',
                  width: 37,
                  height: 37,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'images/user.svg',
                  width: 37,
                  height: 37,
                ),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }

  void openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
