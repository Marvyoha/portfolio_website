import 'package:flutter/material.dart';
import 'package:my_portfolio_website/pages/widgets/components/certificates_widget.dart';
import 'package:my_portfolio_website/pages/widgets/components/experience_widget.dart';
import 'package:my_portfolio_website/pages/widgets/components/main_header.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';

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
              children: Content.educationList
                  .map((edu) => Column(
                        children: [
                          EducationWidget(
                              education: edu,
                              platformWidth: platformWidth,
                              platformHeight: platformHeight),
                          GlobalVariables.layoutSpaceMedium(
                            platformHeight: platformHeight,
                            platformWidth: platformWidth,
                          )
                        ],
                      ))
                  .toList(), // Removed extra comma
            ),
          ],
        ),

        layoutProvider.currentPlatform == Platform.desktop
            ? PortfolioDivider(
                platformWidth: platformWidth, platformHeight: platformHeight)
            : const SizedBox(),
        // CERTIFICATES
        Column(
          children: [
            const SectionHeader(content: 'Certificates'),
            GlobalVariables.layoutSpaceMedium(
                platformHeight: platformHeight, platformWidth: platformWidth),
            layoutProvider.currentPlatform == Platform.desktop
                ?
                // FOR DESKTOP
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: Content.certificatesList
                            .asMap() // Convert to a map to access indices
                            .entries
                            .where((entry) =>
                                entry.key == 0 ||
                                entry.key % 2 ==
                                    0) // Filter for index 0 or even indices
                            .map((entry) => Column(
                                  children: [
                                    CertificatesWidget(
                                      cert: entry
                                          .value, // Use the value from the entry
                                      platformWidth: platformWidth,
                                      platformHeight: platformHeight,
                                    ),
                                    GlobalVariables.layoutSpaceMedium(
                                        platformHeight: platformHeight,
                                        platformWidth: platformWidth),
                                  ],
                                ))
                            .toList(),
                      ),
                      Column(
                        children: Content.certificatesList
                            .asMap() // Convert to a map to access indices
                            .entries
                            .where((entry) =>
                                entry.key % 2 != 0) // Filter for odd indices
                            .map((entry) => Column(
                                  children: [
                                    CertificatesWidget(
                                      cert: entry
                                          .value, // Use the value from the entry
                                      platformWidth: platformWidth,
                                      platformHeight: platformHeight,
                                    ),
                                    GlobalVariables.layoutSpaceMedium(
                                        platformHeight: platformHeight,
                                        platformWidth: platformWidth),
                                  ],
                                ))
                            .toList(),
                      )
                    ],
                  )
                :
                // FOR MOBILE AND TABLET
                Column(
                    children: Content.certificatesList
                        .map((cert) => Column(
                              children: [
                                CertificatesWidget(
                                  cert: cert,
                                  platformWidth: platformWidth,
                                  platformHeight: platformHeight,
                                ),
                                GlobalVariables.layoutSpaceMedium(
                                    platformHeight: platformHeight,
                                    platformWidth: platformWidth),
                              ],
                            ))
                        .toList(), // Removed extra comma
                  ),
          ],
        ),
        layoutProvider.currentPlatform == Platform.desktop
            ? PortfolioDivider(
                platformWidth: platformWidth, platformHeight: platformHeight)
            : const SizedBox(),
        // EXPERIENCE
        Column(
          children: [
            const SectionHeader(content: 'Experience'),
            GlobalVariables.layoutSpaceMedium(
                platformHeight: platformHeight, platformWidth: platformWidth),
            Column(
              children: Content.experienceList
                  .map((exp) => Column(
                        children: [
                          ExperienceWidget(
                              exp: exp,
                              platformWidth: platformWidth,
                              platformHeight: platformHeight),
                          GlobalVariables.layoutSpaceMedium(
                            platformHeight: platformHeight,
                            platformWidth: platformWidth,
                          )
                        ],
                      ))
                  .toList(), // Removed extra comma
            ),
          ],
        ),
      ],
    );
  }
}
