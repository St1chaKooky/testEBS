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

class MethodTitle {
  String truncateString(String input, int maxLength) {
    if (input.length <= maxLength) {
      return input;
    }

    final truncated = input.substring(0, maxLength);

    final lastSpaceIndex = truncated.lastIndexOf(' ');

    if (lastSpaceIndex != -1) {
      return truncated.substring(0, lastSpaceIndex);
    } else {
      return truncated;
    }
  }
}
