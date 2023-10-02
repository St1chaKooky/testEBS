import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('sas'),
            subtitle: Text('fsd'),
            // Добавьте другие виджеты для отображения другой информации о товаре
          );
        },
      ),
    );
  }
}
