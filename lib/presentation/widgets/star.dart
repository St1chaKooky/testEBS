import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Star extends StatelessWidget {
  const Star({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        child: SvgPicture.asset(
          'images/star_yell.svg',
          width: 15,
          height: 15,
        ),
      ),
    );
  }
}
