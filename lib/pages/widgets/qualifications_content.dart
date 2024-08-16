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
                Column(
                    children: [
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
                          platformHeight: platformHeight,
                          platformWidth: platformWidth),
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
                          platformHeight: platformHeight,
                          platformWidth: platformWidth),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CertificatesWidget(
                            cert: Content.certificatesList[4],
                            platformWidth: platformWidth,
                            platformHeight: platformHeight,
                          ),
                        ],
                      ),
                    ],
                  )
                :
                // FOR MOBILE AND TABLET
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
