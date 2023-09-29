import 'package:flutter/widgets.dart';

class ScreenSize {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

class ScreenSizeHeight {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
