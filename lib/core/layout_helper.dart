import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/pages/desktop/homepage_desktop.dart';
import 'package:my_portfolio_website/pages/mobile/homepage_mobile.dart';

import '../pages/tablet/homepage_tablet.dart';

class ResponsiveLayout extends StatelessWidget {
  // final Widget mobileLayout;
  // final Widget desktopLayout;

  const ResponsiveLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return HomepageMobile(
              platformWidth: constraints.maxWidth,
              platformHeight: constraints.maxHeight);
        } else if (constraints.maxWidth >= mobileWidth &&
            constraints.maxWidth < desktopWidth) {
          return HomepageTablet(
              platformWidth: constraints.maxWidth,
              platformHeight: constraints.maxHeight);
        } else {
          return HomepageDesktop(
              platformWidth: constraints.maxWidth,
              platformHeight: constraints.maxHeight);
        }
      },
    );
  }
}
