import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:my_portfolio_website/constants/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:text_responsive/text_responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/providers/layout_provider.dart';

class HomeContents extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const HomeContents(
      {super.key, required this.platformWidth, required this.platformHeight});

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);
    Widget layoutChecker() {
      switch (layoutProvider.currentPlatform) {
        case Platform.mobile:
          return MobileHome(
              platformHeight: platformHeight, platformWidth: platformWidth);
        case Platform.tablet:
          return TabletHome(
              platformHeight: platformHeight, platformWidth: platformWidth);
        case Platform.desktop:
          return DesktopHome(
            platformHeight: platformHeight,
            platformWidth: platformWidth,
          );
      }
    }

    return layoutChecker();
  }
}

class MobileHome extends StatelessWidget {
  const MobileHome({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  final double platformWidth;
  final double platformHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GlobalVariables.mobilePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: platformWidth * 0.6,
                maxHeight: 200,
              ),
              child: Material(
                shadowColor: Theme.of(context).colorScheme.secondary,
                elevation: 5,
                borderRadius: BorderRadius.circular(40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'lib/assets/profile.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          GlobalVariables.spaceSmall(),
          Text(
            Content.introHeader,
            style: WriteStyles.header1Mobile(context),
          ),
          GlobalVariables.spaceSmallest(),
          Text(
            Content.introduction,
            style: WriteStyles.body1TabletandMobile(context),
          ),
          GlobalVariables.spaceSmall(),
          Row(
            children: [
              const Icon(CarbonIcons.location),
              GlobalVariables.spaceSmaller(isWidth: true),
              Text(
                Content.location,
                style: WriteStyles.body1TabletandMobile(context),
              ),
            ],
          ),
          GlobalVariables.spaceSmallest(),
          Row(
            children: [
              const Icon(CarbonIcons.email),
              GlobalVariables.spaceSmaller(isWidth: true),
              SelectableText(
                Content.email,
                style: WriteStyles.body1TabletandMobile(context),
              ),
            ],
          ),
          GlobalVariables.spaceSmallest(),
          Row(
            children: [
              const Icon(
                CarbonIcons.dot_mark,
                color: Colors.green,
              ),
              GlobalVariables.spaceSmaller(isWidth: true),
              Text(
                Content.availability,
                style: WriteStyles.body1TabletandMobile(context),
              ),
            ],
          ),
          GlobalVariables.spaceSmall(),
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  if (await canLaunchUrl(Content.githubLink)) {
                    await launchUrl(Content.githubLink,
                        mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch ${Content.githubLink}';
                  }
                },
                icon: const Icon(CarbonIcons.logo_github),
                iconSize: 40,
              ),
              IconButton(
                onPressed: () async {
                  if (await canLaunchUrl(Content.linkedinLink)) {
                    await launchUrl(Content.linkedinLink,
                        mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch ${Content.linkedinLink}';
                  }
                },
                icon: const Icon(CarbonIcons.logo_linkedin),
                iconSize: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TabletHome extends StatelessWidget {
  const TabletHome({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  final double platformWidth;
  final double platformHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GlobalVariables.mobilePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: platformWidth * 0.6,
                // maxHeight: 200,
              ),
              child: Material(
                shadowColor: Theme.of(context).colorScheme.secondary,
                elevation: 5,
                borderRadius: BorderRadius.circular(40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    'lib/assets/profile.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          GlobalVariables.spaceSmall(),
          Text(
            Content.introHeader,
            style: WriteStyles.header1Tablet(context),
          ),
          GlobalVariables.spaceSmallest(),
          Text(
            Content.introduction,
            style: WriteStyles.body1TabletandMobile(context),
          ),
          GlobalVariables.spaceSmall(),
          Row(
            children: [
              const Icon(CarbonIcons.location),
              GlobalVariables.spaceSmaller(isWidth: true),
              Text(
                Content.location,
                style: WriteStyles.body1TabletandMobile(context),
              ),
            ],
          ),
          GlobalVariables.spaceSmallest(),
          Row(
            children: [
              const Icon(CarbonIcons.email),
              GlobalVariables.spaceSmaller(isWidth: true),
              SelectableText(
                Content.email,
                style: WriteStyles.body1TabletandMobile(context),
              ),
            ],
          ),
          GlobalVariables.spaceSmallest(),
          Row(
            children: [
              const Icon(
                CarbonIcons.dot_mark,
                color: Colors.green,
              ),
              GlobalVariables.spaceSmaller(isWidth: true),
              Text(
                Content.availability,
                style: WriteStyles.body1TabletandMobile(context),
              ),
            ],
          ),
          GlobalVariables.spaceSmall(),
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  if (await canLaunchUrl(Content.githubLink)) {
                    await launchUrl(Content.githubLink,
                        mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch ${Content.githubLink}';
                  }
                },
                icon: const Icon(CarbonIcons.logo_github),
                iconSize: 40,
              ),
              IconButton(
                onPressed: () async {
                  if (await canLaunchUrl(Content.linkedinLink)) {
                    await launchUrl(Content.linkedinLink,
                        mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch ${Content.linkedinLink}';
                  }
                },
                icon: const Icon(CarbonIcons.logo_linkedin),
                iconSize: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// DESKTOP HOME
class DesktopHome extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const DesktopHome({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: platformWidth * 0.5,
              child: Text(
                Content.introHeader,
                style: WriteStyles.header1Desktop(context),
              ),
            ),
            SizedBox(
              width: platformWidth * 0.5,
              child: Text(
                Content.introduction,
                style: WriteStyles.body1Desktop(context),
              ),
            ),
            GlobalVariables.layoutSpaceMedium(
                platformHeight: platformHeight, platformWidth: platformWidth),
            // GlobalVariables.spaceMedium(),
            Row(
              children: [
                const Icon(CarbonIcons.location),
                GlobalVariables.spaceSmaller(isWidth: true),
                Text(
                  Content.location,
                  style: WriteStyles.body1Desktop(context),
                ),
              ],
            ),
            GlobalVariables.layoutSpaceSmaller(
                platformHeight: platformHeight, platformWidth: platformWidth),
            Row(
              children: [
                const Icon(CarbonIcons.email),
                GlobalVariables.spaceSmaller(isWidth: true),
                SelectableText(
                  Content.email,
                  style: WriteStyles.body1Desktop(context),
                ),
              ],
            ),
            GlobalVariables.layoutSpaceSmaller(
                platformHeight: platformHeight, platformWidth: platformWidth),
            Row(
              children: [
                const Icon(
                  CarbonIcons.dot_mark,
                  color: Colors.green,
                ),
                GlobalVariables.spaceSmaller(isWidth: true),
                Text(
                  Content.availability,
                  style: WriteStyles.body1Desktop(context),
                ),
              ],
            ),
            GlobalVariables.layoutSpaceMedium(
                platformHeight: platformHeight, platformWidth: platformWidth),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    if (await canLaunchUrl(Content.githubLink)) {
                      await launchUrl(Content.githubLink,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch ${Content.githubLink}';
                    }
                  },
                  icon: const Icon(CarbonIcons.logo_github),
                  iconSize: 40,
                ),
                IconButton(
                  onPressed: () async {
                    if (await canLaunchUrl(Content.linkedinLink)) {
                      await launchUrl(Content.linkedinLink,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch ${Content.linkedinLink}';
                    }
                  },
                  icon: const Icon(CarbonIcons.logo_linkedin),
                  iconSize: 40,
                ),
              ],
            )
          ],
        ),
        GlobalVariables.spaceMedium(isWidth: true),
        Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.topRight,
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
                      Content.profile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
