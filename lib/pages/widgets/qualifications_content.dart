import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio_website/components/certificates_widget.dart';
import 'package:my_portfolio_website/components/main_header.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/education_widget.dart';
import '../../components/section_header.dart';
import '../../constants/app_strings.dart';
import '../../core/models/certificates_model.dart';
import '../../core/models/education_model.dart';
import '../../core/providers/layout_provider.dart';

List educationList = [
  EducationModel(
      image: Content.calebLogo,
      degree:
          'Bachelor of Computer Science: College of Pure and Applied Sciences',
      school: 'Caleb University',
      timeRange: '2020 - 2024',
      location: 'Imota, Lagos, Nigeria'),
  EducationModel(
      image: Content.cmsLogo,
      degree: 'WASSCE',
      school: 'CMS Grammar School',
      timeRange: '2013 - 2019',
      location: 'Bariga, Lagos, Nigeria'),
];

List certificatesList = [
  CertificatesModel(
      issuedBy: 'Google',
      viewCredential: Content.certDigitalMarketing,
      image: Content.googleLogo,
      course: 'Introduction to Digital Marketing'),
  CertificatesModel(
      issuedBy: 'Google',
      viewCredential: Content.certCrashCourseOnPython,
      image: Content.googleLogo,
      course: 'Crash Course on Python'),
  CertificatesModel(
      issuedBy: 'Google',
      viewCredential: Content.certUsingPythonToInteractWithOS,
      image: Content.googleLogo,
      course: 'Python with the Operating System'),
  CertificatesModel(
      issuedBy: 'IBM',
      viewCredential: Content.certIntroToWebDev,
      image: Content.ibmLogo,
      course: 'Introduction to Web Development'),
  CertificatesModel(
      issuedBy: 'IBM',
      viewCredential: Content.certIntroToCloudComputing,
      image: Content.ibmLogo,
      course: 'Introduction to Cloud Computing'),
];

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
      children: [
        MainHeader(
            content: 'Qualifications',
            platformWidth: platformWidth,
            platformHeight: platformHeight),
        GlobalVariables.desktopSpaceMedium(
            platformHeight: platformHeight, platformWidth: platformWidth),
        // EDUCATION
        const SectionHeader(content: 'Education'),
        GlobalVariables.desktopSpaceMedium(
            platformHeight: platformHeight, platformWidth: platformWidth),
        SizedBox(
          height: platformHeight * 0.165 * educationList.length,
          child: ListView.builder(
            itemCount: educationList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  EducationWidget(
                      education: educationList[index],
                      platformWidth: platformWidth,
                      platformHeight: platformHeight),
                ],
              );
            },
          ),
        ),
        GlobalVariables.desktopSpaceLarge(
            platformHeight: platformHeight, platformWidth: platformWidth),
        const Divider(),
        GlobalVariables.desktopSpaceLarge(
            platformHeight: platformHeight, platformWidth: platformWidth),
        // CERTIFICATES
        const SectionHeader(content: 'Certificates'),

        GlobalVariables.desktopSpaceLarge(
            platformHeight: platformHeight, platformWidth: platformWidth),

        SizedBox(
          height: platformHeight * 0.1 * certificatesList.length,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 600, // Adjust this value as needed
              mainAxisExtent: 120,
              crossAxisSpacing: 16, childAspectRatio: 1,
              mainAxisSpacing: 16,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: certificatesList.length,
            itemBuilder: (BuildContext context, int index) {
              return CertificatesWidget(
                  cert: certificatesList[index],
                  platformWidth: platformWidth,
                  platformHeight: platformHeight);
            },
          ),
        ),
      ],
    );
  }
}
