import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_fonts.dart';
import '../core/providers/layout_provider.dart';

class MainHeader extends StatelessWidget {
  final String content;
  final double platformWidth;
  final double platformHeight;
  const MainHeader({
    super.key,
    required this.content,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);
    TextStyle fontStyler() {
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
        Text(content, style: fontStyler()),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Divider(
              color: Theme.of(context).colorScheme.primary,
              thickness: 3,
              height: 1,
              indent: platformWidth * 0.25,
              endIndent: platformWidth * 0.25,
            ),
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: platformHeight * 0.02,
              width: platformWidth * 0.05,
            ),
          ],
        )
      ],
    );
  }
}
