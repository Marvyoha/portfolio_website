import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/core/models/education_model.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/app_fonts.dart';
import '../../../../../core/providers/layout_provider.dart';

class EducationWidget extends StatelessWidget {
  final EducationModel education;
  final double platformWidth;
  final double platformHeight;
  const EducationWidget({
    super.key,
    required this.education,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);

    TextStyle fontStyler() {
      switch (layoutProvider.currentPlatform) {
        case Platform.desktop:
          return WriteStyles.subtitleDesktop(context);

        default:
          return WriteStyles.subtitleTabletandMobile(context);
      }
    }

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
        Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                education.image,
                fit: BoxFit.fill,
              ),
            ),
            GlobalVariables.desktopSpaceSmaller(
                platformHeight: platformHeight,
                platformWidth: platformWidth,
                isWidth: true),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: platformWidth * 0.6,
                  child: Text(
                    education.degree,
                    style: fontStyler(),
                  ),
                ),
                SizedBox(
                  width: platformWidth * 0.2,
                  child: Text(
                    education.school,
                    style: WriteStyles.body2(context),
                  ),
                ),
                Text(
                  education.timeRange,
                  style: WriteStyles.body2(context),
                ),
                SizedBox(
                  width: platformWidth * 0.2,
                  child: Text(
                    education.location,
                    style: WriteStyles.body2(context),
                  ),
                )
              ],
            )
          ],
        ),
        GlobalVariables.desktopSpaceSmaller(
          platformHeight: platformHeight,
          platformWidth: platformWidth,
        ),
      ],
    );
  }
}
