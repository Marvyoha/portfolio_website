import 'package:flutter/material.dart';
import 'package:my_portfolio_website/core/models/experience_model.dart';
import 'package:my_portfolio_website/pages/widgets/components/certificates_widget.dart';
import 'package:my_portfolio_website/pages/widgets/components/experience_widget.dart';
import 'package:my_portfolio_website/pages/widgets/components/main_header.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:my_portfolio_website/pages/widgets/components/portfolio_divider.dart';
import 'package:provider/provider.dart';

import 'components/education_widget.dart';
import 'components/section_header.dart';
import '../../constants/app_strings.dart';
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
    return Column(
      children: <Widget>[
        MainHeader(
            content: 'Qualifications',
            platformWidth: platformWidth,
            platformHeight: platformHeight),

        // EDUCATION
        Column(
          children: [
            const SectionHeader(content: 'Education'),
            GlobalVariables.layoutSpaceMedium(
                platformHeight: platformHeight, platformWidth: platformWidth),
            Column(
              children: [
                EducationWidget(
                    education: Content.educationList[0],
                    platformWidth: platformWidth,
                    platformHeight: platformHeight),
                GlobalVariables.layoutSpaceMedium(
                  platformHeight: platformHeight,
                  platformWidth: platformWidth,
                ),
                EducationWidget(
                    education: Content.educationList[1],
                    platformWidth: platformWidth,
                    platformHeight: platformHeight),
              ],
            ),
          ],
        ),

        PortfolioDivider(
            platformWidth: platformWidth, platformHeight: platformHeight),
        // CERTIFICATES
        Column(
          children: [
            const SectionHeader(content: 'Certificates'),
            GlobalVariables.layoutSpaceMedium(
                platformHeight: platformHeight, platformWidth: platformWidth),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CertificatesWidget(
                  cert: Content.certificatesList[0],
                  platformWidth: platformWidth,
                  platformHeight: platformHeight,
                ),
                CertificatesWidget(
                  cert: Content.certificatesList[1],
                  platformWidth: platformWidth,
                  platformHeight: platformHeight,
                ),
              ],
            ),
            GlobalVariables.layoutSpaceMedium(
                platformHeight: platformHeight, platformWidth: platformWidth),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CertificatesWidget(
                  cert: Content.certificatesList[2],
                  platformWidth: platformWidth,
                  platformHeight: platformHeight,
                ),
                CertificatesWidget(
                  cert: Content.certificatesList[3],
                  platformWidth: platformWidth,
                  platformHeight: platformHeight,
                ),
              ],
            ),
            GlobalVariables.layoutSpaceMedium(
                platformHeight: platformHeight, platformWidth: platformWidth),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CertificatesWidget(
                  cert: Content.certificatesList[4],
                  platformWidth: platformWidth,
                  platformHeight: platformHeight,
                ),
              ],
            )
          ],
        ),
        PortfolioDivider(
            platformWidth: platformWidth, platformHeight: platformHeight),
        // EXPERIENCE
        Column(
          children: [
            const SectionHeader(content: 'Experience'),
            GlobalVariables.layoutSpaceMedium(
                platformHeight: platformHeight, platformWidth: platformWidth),
            ExperienceWidget(
                exp: Content.experienceList[0],
                platformWidth: platformWidth,
                platformHeight: platformHeight),
          ],
        ),
      ],
    );
  }
}
