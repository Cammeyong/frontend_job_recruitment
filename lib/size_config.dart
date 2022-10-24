import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData  _mediaQueryData = _mediaQueryData = MediaQuery.of(context);
  static double screenWidth = screenWidth = _mediaQueryData.size.width;
  static double screenHeight = screenHeight = _mediaQueryData.size.height;
  static double defaultSize = defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  static Orientation orientation = orientation = _mediaQueryData.orientation;
  
  // ignore: null_check_always_fails
  static BuildContext get context => null!;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}