import 'package:flutter/widgets.dart';

class SizeConfig {
  late Size _mediaQuerySize;
  late EdgeInsets _mediaQueryPadding;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  late double _safeAreaHorizontal;
  late double _safeAreaVertical;


  void init(BuildContext context) {
    _mediaQuerySize = MediaQuery.sizeOf(context);
    _mediaQueryPadding = MediaQuery.paddingOf(context);
    screenWidth = _mediaQuerySize.width;
    screenHeight = _mediaQuerySize.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryPadding.left + _mediaQueryPadding.right;
    _safeAreaVertical = _mediaQueryPadding.top + _mediaQueryPadding.bottom;

  }
}
