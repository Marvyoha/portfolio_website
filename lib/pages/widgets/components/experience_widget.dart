import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/core/models/experience_model.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/app_fonts.dart';
import '../../../../../core/providers/layout_provider.dart';

class ExperienceWidget extends StatelessWidget {
  final ExperienceModel exp;

  final double platformWidth;
  final double platformHeight;
  const ExperienceWidget(
      {super.key,
      required this.exp,
      required this.platformWidth,
      required this.platformHeight});

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);
    TextStyle fontStyler() {
      switch (layoutProvider.currentPlatform) {
        case Platform.desktop:
          return WriteStyles.subtitleDesktop(context)
              .copyWith(fontWeight: FontWeight.bold);

        default:
          return WriteStyles.subtitleTabletandMobile(context)
              .copyWith(fontWeight: FontWeight.bold);
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

    return Material(
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        borderRadius: BorderRadius.circular(40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    exp.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: platformWidth * 0.4,
                    child: Text(
                      exp.jobTitle,
                      style: fontStyler(),
                    ),
                  ),
                  GlobalVariables.layoutSpaceMedium(
                      platformHeight: platformHeight,
                      platformWidth: platformWidth),
                  SizedBox(
                    width: platformWidth * 0.4,
                    child: Text(
                      exp.jobDescription,
                      style: WriteStyles.body2(context),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: platformWidth * 0.15,
                  child: Text(
                    exp.timeRange,
                    style: WriteStyles.body2(context),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
