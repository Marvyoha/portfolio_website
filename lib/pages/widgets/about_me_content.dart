import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:provider/provider.dart';

import 'components/main_header.dart';

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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MainHeader(
        content: 'About Me',
        platformHeight: platformHeight,
        platformWidth: platformWidth,
      ),
      Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: platformWidth * 0.6,
            maxHeight: platformHeight * 0.4,
          ),
          child: Material(
            shadowColor: Theme.of(context).colorScheme.secondary,
            elevation: 5,
            borderRadius: BorderRadius.circular(40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                Content.profile2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      GlobalVariables.layoutSpaceMedium(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Column(
        children: [
          Text(
            Content.aboutMeIntro,
            style: WriteStyles.header3TabletandMobile(context),
          ),
          GlobalVariables.layoutSpaceSmaller(
              platformHeight: platformHeight, platformWidth: platformWidth),
          ExpandableText(
            Content.aboutMe,
            style: WriteStyles.body3(context),
            linkEllipsis: false,
            linkColor: Theme.of(context).colorScheme.outline,
            expandText: 'Show more',
            collapseText: 'Show less',
            maxLines: 15,
          )
        ],
      ),
    ]);
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MainHeader(
        content: 'About Me',
        platformHeight: platformHeight,
        platformWidth: platformWidth,
      ),
      Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: platformWidth * 0.55,
            maxHeight: platformHeight * 0.45,
          ),
          child: Material(
            shadowColor: Theme.of(context).colorScheme.secondary,
            elevation: 5,
            borderRadius: BorderRadius.circular(40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                Content.profile2,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      GlobalVariables.layoutSpaceMedium(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Column(
        children: [
          Text(
            Content.aboutMeIntro,
            style: WriteStyles.header3Desktop(context),
          ),
          GlobalVariables.layoutSpaceSmaller(
              platformHeight: platformHeight, platformWidth: platformWidth),
          ExpandableText(
            Content.aboutMe,
            style: WriteStyles.body1TabletandMobile(context),
            linkEllipsis: false,
            linkColor: Theme.of(context).colorScheme.outline,
            expandText: 'Show more',
            collapseText: 'Show less',
            maxLines: 15,
          )
        ],
      ),
    ]);
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
        MainHeader(
          content: 'About Me',
          platformHeight: platformHeight,
          platformWidth: platformWidth,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 2,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: platformWidth * 0.3,
                    // maxHeight: platformHeight * 0.45,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      shadowColor: Theme.of(context).colorScheme.secondary,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          Content.profile2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )),
            // GlobalVariables.layoutSpaceLarge(
            //     platformHeight: platformHeight,
            //     platformWidth: platformWidth,
            //     isWidth: true),
            Column(
              children: [
                SizedBox(
                  width: platformWidth * 0.47,
                  child: Text(
                    Content.aboutMeIntro,
                    style: WriteStyles.header3Desktop(context),
                  ),
                ),
                GlobalVariables.layoutSpaceSmaller(
                    platformHeight: platformHeight,
                    platformWidth: platformWidth),
                SizedBox(
                  width: platformWidth * 0.47,
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
