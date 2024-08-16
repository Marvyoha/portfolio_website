import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_strings.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import '../../constants/app_fonts.dart';
import '../../core/providers/layout_provider.dart';

class GetInTouchContent extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const GetInTouchContent(
      {super.key, required this.platformWidth, required this.platformHeight});

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);
    Widget layoutChecker() {
      switch (layoutProvider.currentPlatform) {
        case Platform.mobile:
          return MobileGetInTouch(
              platformWidth: platformWidth, platformHeight: platformHeight);
        case Platform.tablet:
          return TabletGetInTouch(
              platformWidth: platformWidth, platformHeight: platformHeight);
        case Platform.desktop:
          return DesktopGetInTouch(
              platformWidth: platformWidth, platformHeight: platformHeight);
      }
    }

    return layoutChecker();
  }
}

class MobileGetInTouch extends StatelessWidget {
  final double platformHeight;
  final double platformWidth;
  const MobileGetInTouch(
      {super.key, required this.platformHeight, required this.platformWidth});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text('Get in touch'),
      ),
      GlobalVariables.layoutSpaceSmaller(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Text(
        "What's next? Feel free to reach out to me if you're looking for a developer, have a query, or simply want to connect.",
        style: WriteStyles.body2(context),
      ),
      GlobalVariables.layoutSpaceMedium(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(CarbonIcons.email),
        GlobalVariables.layoutSpaceSmaller(
            platformHeight: platformHeight,
            platformWidth: platformWidth,
            isWidth: true),
        SelectableText(
          Content.email,
          style: WriteStyles.body3(context),
        ),
      ]),
      GlobalVariables.layoutSpaceSmaller(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CarbonIcons.phone),
          GlobalVariables.layoutSpaceSmaller(
              platformHeight: platformHeight,
              platformWidth: platformWidth,
              isWidth: true),
          SelectableText(
            Content.phoneNumber,
            style: WriteStyles.body3(context),
          )
        ],
      )
    ]);
  }
}

class TabletGetInTouch extends StatelessWidget {
  final double platformHeight;
  final double platformWidth;
  const TabletGetInTouch(
      {super.key, required this.platformHeight, required this.platformWidth});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text('Get in touch'),
      ),
      GlobalVariables.layoutSpaceSmaller(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Text(
        "What's next? Feel free to reach out to me if you're looking for a developer, have a query, or simply want to connect.",
        style: WriteStyles.body2(context),
      ),
      GlobalVariables.layoutSpaceMedium(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(CarbonIcons.email),
        GlobalVariables.layoutSpaceSmaller(
            platformHeight: platformHeight,
            platformWidth: platformWidth,
            isWidth: true),
        SelectableText(
          Content.email,
          style: WriteStyles.subtitleTabletandMobile(context),
        ),
      ]),
      GlobalVariables.layoutSpaceSmaller(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CarbonIcons.phone),
          GlobalVariables.layoutSpaceSmaller(
              platformHeight: platformHeight,
              platformWidth: platformWidth,
              isWidth: true),
          SelectableText(
            Content.phoneNumber,
            style: WriteStyles.subtitleTabletandMobile(context),
          )
        ],
      )
    ]);
  }
}

class DesktopGetInTouch extends StatelessWidget {
  final double platformHeight;
  final double platformWidth;
  const DesktopGetInTouch(
      {super.key, required this.platformHeight, required this.platformWidth});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text('Get in touch'),
      ),
      GlobalVariables.layoutSpaceSmaller(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Text(
        "What's next? Feel free to reach out to me if you're looking for a developer, have a query, or simply want to connect.",
        style: WriteStyles.subtitleDesktop(context),
      ),
      GlobalVariables.layoutSpaceMedium(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(CarbonIcons.email),
        GlobalVariables.layoutSpaceSmaller(
            platformHeight: platformHeight,
            platformWidth: platformWidth,
            isWidth: true),
        SelectableText(
          Content.email,
          style: WriteStyles.header2Desktop(context),
        ),
      ]),
      GlobalVariables.layoutSpaceSmaller(
          platformHeight: platformHeight, platformWidth: platformWidth),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CarbonIcons.phone),
          GlobalVariables.layoutSpaceSmaller(
              platformHeight: platformHeight,
              platformWidth: platformWidth,
              isWidth: true),
          SelectableText(
            Content.phoneNumber,
            style: WriteStyles.header2Desktop(context),
          )
        ],
      )
    ]);
  }
}
