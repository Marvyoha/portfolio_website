import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_constants.dart';
import '../pages/desktop/homepage_desktop.dart';
import '../pages/mobile/homepage_mobile.dart';
import '../pages/tablet/homepage_tablet.dart';
import 'providers/layout_provider.dart';

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
            final mobileConstraints = constraints;
            return HomepageMobile(
              platformWidth: mobileConstraints.maxWidth,
              platformHeight: mobileConstraints.maxHeight,
            );

          case >= mobileWidth && < desktopWidth:
            layoutProvider.currentPlatform = Platform.tablet;
            final tabletConstraints = constraints;
            return HomepageTablet(
              platformWidth: tabletConstraints.maxWidth,
              platformHeight: tabletConstraints.maxHeight,
            );

          default:
            layoutProvider.currentPlatform = Platform.desktop;
            final desktopConstraints = constraints;
            return HomepageDesktop(
              platformWidth: desktopConstraints.maxWidth,
              platformHeight: desktopConstraints.maxHeight,
            );
        }
      },
    );
  }
}
