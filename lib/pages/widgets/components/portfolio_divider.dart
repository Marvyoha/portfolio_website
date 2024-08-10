import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/app_constants.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../core/providers/layout_provider.dart';

class PortfolioDivider extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const PortfolioDivider(
      {super.key, required this.platformWidth, required this.platformHeight});

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);
    // * Implement when needed on the spacer
    TextStyle layoutSpacer() {
      switch (layoutProvider.currentPlatform) {
        case Platform.mobile:
          return WriteStyles.header1Mobile(context);
        case Platform.tablet:
          return WriteStyles.header1Tablet(context);

        default:
          return WriteStyles.header1Desktop(context);
      }
    }

    return Column(
      children: [
        GlobalVariables.layoutSpaceLarge(
            platformHeight: platformHeight, platformWidth: platformWidth),
        const Divider(),
        GlobalVariables.layoutSpaceLarge(
            platformHeight: platformHeight, platformWidth: platformWidth),
      ],
    );
  }
}
