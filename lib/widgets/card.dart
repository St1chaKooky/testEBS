import 'package:flutter/material.dart';
import 'package:test_ebs/utils/screen_size.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = ScreenSize.screenWidth(context);
    double heightPicture = width / 1.5625;
    double widthPicture = width / 2.28;
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: widthPicture,
              height: heightPicture,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Title'),
            Text('leading'),
            const SizedBox(
              height: 4,
            ),
            Text("\323")
          ]),
    );
  }
}
