import 'package:flutter/material.dart';

/// The max width the content can ever take up on the screen
const double desktopWidth = 1024;

const double mobileWidth = 768;

// The max height the homeview will take up
const double kdDesktopMaxContentHeight = 750;

class GlobalVariables {
  static double sizeHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double sizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static EdgeInsetsGeometry desktopPadding =
      const EdgeInsets.fromLTRB(80, 100, 80, 100);
  static EdgeInsetsGeometry desktopPaddingMain =
      const EdgeInsets.fromLTRB(80, 56, 80, 100);

  static EdgeInsetsGeometry mobilePadding =
      const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsetsGeometry drawerPadding =
      const EdgeInsets.fromLTRB(10, 20, 10, 0);

  static spaceLarge(BuildContext context, {bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(width: sizeWidth(context) * 0.1);
    }
    return SizedBox(height: sizeHeight(context) * 0.1);
  }

  static spaceMedium({bool isWidth = false}) {
    if (isWidth == true) {
      return const SizedBox(
        width: 30,
      );
    }
    return const SizedBox(
      height: 30,
    );
  }

// *
  static spaceSmall({bool isWidth = false}) {
    if (isWidth == true) {
      return const SizedBox(
        width: 16,
      );
    }
    return const SizedBox(
      height: 16,
    );
  }

// *
  static spaceSmaller({bool isWidth = false}) {
    if (isWidth == true) {
      return const SizedBox(
        width: 10,
      );
    }
    return const SizedBox(
      height: 10,
    );
  }

  static spaceSmallest({bool isWidth = false}) {
    if (isWidth == true) {
      return const SizedBox(
        width: 8,
      );
    }
    return const SizedBox(
      height: 8,
    );
  }

  static layoutSpaceLarge(
      {required double platformHeight,
      required double platformWidth,
      bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(
        width: platformWidth * 0.06,
      );
    }
    return SizedBox(
      height: platformHeight * 0.06,
    );
  }

  static layoutSpaceMedium(
      {required double platformHeight,
      required double platformWidth,
      bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(
        width: platformWidth * 0.03,
      );
    }
    return SizedBox(
      height: platformHeight * 0.03,
    );
  }

  static layoutSpaceSmaller(
      {required double platformHeight,
      required double platformWidth,
      bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(
        width: platformWidth * 0.01,
      );
    }
    return SizedBox(
      height: platformHeight * 0.01,
    );
  }
}
