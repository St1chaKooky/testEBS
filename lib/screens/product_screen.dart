import 'package:flutter/material.dart';
import 'package:test_ebs/utils/screen_size.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = ScreenSizeHeight.screenWidth(context);
    double heightPicture = width / 1.691;

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          expandedHeight: heightPicture,
          pinned: true,
          floating: true,
          snap: false,
          flexibleSpace: const FlexibleSpaceBar(
            collapseMode: CollapseMode.none,
            background:
                Image(image: AssetImage('images/image.jpg'), fit: BoxFit.cover),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      height: 120,
                      width: 200,
                      color: Colors.amber,
                    ),
                childCount: 10))
      ]),
    );
  }
}
