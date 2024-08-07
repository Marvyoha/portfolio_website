import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/core/providers/layout_provider.dart';
import 'package:my_portfolio_website/pages/desktop/homepage_desktop.dart';
import 'package:my_portfolio_website/pages/mobile/homepage_mobile.dart';
import 'package:provider/provider.dart';
import '../pages/tablet/homepage_tablet.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        switch (constraints.maxWidth) {
          case < mobileWidth:
            layoutProvider.currentPlatform = Platform.mobile;
            return HomepageMobile(
              platformWidth: constraints.maxWidth,
              platformHeight: constraints.maxHeight,
            );

          case >= mobileWidth && < desktopWidth:
            layoutProvider.currentPlatform = Platform.tablet;
            return HomepageTablet(
              platformWidth: constraints.maxWidth,
              platformHeight: constraints.maxHeight,
            );

          default:
            layoutProvider.currentPlatform = Platform.desktop;
            return HomepageDesktop(
              platformWidth: constraints.maxWidth,
              platformHeight: constraints.maxHeight,
            );
        }
      },
    );
  }
}
