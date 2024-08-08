import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/section_header.dart';
import '../../core/providers/layout_provider.dart';

class QualificationsContent extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const QualificationsContent(
      {super.key, required this.platformWidth, required this.platformHeight});

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);
    Widget layoutChecker() {
      switch (layoutProvider.currentPlatform) {
        case Platform.mobile:
          return Center(
            child: Text(
              'Qualifications for mobile.',
              style: WriteStyles.header1Mobile(context),
            ),
          );
        case Platform.tablet:
          return Center(
            child: Text(
              'Qualifications for tablet.',
              style: WriteStyles.header1Tablet(context),
            ),
          );
        case Platform.desktop:
          return DesktopQualifications(
            platformHeight: platformHeight,
            platformWidth: platformWidth,
          );
      }
    }

    return layoutChecker();
  }
}

class DesktopQualifications extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const DesktopQualifications({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SectionHeader(
            content: 'Qualifications',
          ),
          Text(
            'Qualifications for desktop.',
            style: WriteStyles.header1Desktop(context),
          ),
        ],
      ),
    );
  }
}
