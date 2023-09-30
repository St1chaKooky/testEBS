import 'package:flutter/material.dart';
import 'package:test_ebs/utils/colors.dart';

class Reviews extends StatefulWidget {
  const Reviews({
    super.key,
    required this.widthPadding,
  });

  final double widthPadding;

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
            top: 32, left: widget.widthPadding, right: widget.widthPadding),
        child: Container(
          width: double.infinity,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
              ),
              child: Container(
                width: 265,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Samuel Smith'),
                        Row(
                          children: [
                            Container(
                              width: 96,
                              height: 18,
                              color: Colors.amber,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                        'dssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss')
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
      itemCount: 4,
    );
  }
}
