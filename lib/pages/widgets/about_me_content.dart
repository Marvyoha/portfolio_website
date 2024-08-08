import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/section_header.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_strings.dart';
import '../../core/providers/layout_provider.dart';

class AboutMeContent extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const AboutMeContent(
      {super.key, required this.platformWidth, required this.platformHeight});

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);
    Widget layoutChecker() {
      switch (layoutProvider.currentPlatform) {
        case Platform.mobile:
          return AboutMeMobile(
              platformWidth: platformWidth, platformHeight: platformHeight);
        case Platform.tablet:
          return AboutMeTablet(
              platformWidth: platformWidth, platformHeight: platformHeight);
        case Platform.desktop:
          return AboutMeDesktop(
            platformHeight: platformHeight,
            platformWidth: platformWidth,
          );
      }
    }

    return layoutChecker();
  }
}

class AboutMeMobile extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const AboutMeMobile({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'About me for tablet.',
      style: WriteStyles.header1Tablet(context),
    );
  }
}

class AboutMeTablet extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const AboutMeTablet({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'About me for tablet.',
      style: WriteStyles.header1Tablet(context),
    );
  }
}

class AboutMeDesktop extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const AboutMeDesktop({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SectionHeader(
          content: 'About me',
        ),
        GlobalVariables.desktopSpaceSmaller(
            platformHeight: platformHeight, platformWidth: platformWidth),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 2,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: platformWidth * 0.3,
                    // maxHeight: platformHeight * 0.45,
                  ),
                  child: Material(
                    shadowColor: Theme.of(context).colorScheme.secondary,
                    elevation: 5,
                    borderRadius: BorderRadius.circular(40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'lib/assets/profile2.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
            // GlobalVariables.desktopSpaceLarge(
            //     platformHeight: platformHeight,
            //     platformWidth: platformWidth,
            //     isWidth: true),
            Column(
              children: [
                SizedBox(
                  width: platformWidth * 0.5,
                  child: Text(
                    Content.aboutMeIntro,
                    style: WriteStyles.header3Desktop(context),
                  ),
                ),
                SizedBox(
                  width: platformWidth * 0.5,
                  child: Text(
                    Content.aboutMe,
                    style: WriteStyles.body2(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
