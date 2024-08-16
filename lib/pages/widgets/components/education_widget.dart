import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/core/models/education_model.dart';
import 'package:my_portfolio_website/pages/widgets/components/portfolio_divider.dart';
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

    Widget layoutWidget() {
      switch (layoutProvider.currentPlatform) {
        case Platform.mobile:
          // FOR MOBILE
          return Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      education.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  GlobalVariables.layoutSpaceSmaller(
                    platformHeight: platformHeight,
                    platformWidth: platformWidth,
                  ),
                  Column(
                    children: [
                      Text(
                        education.degree,
                        style: fontStyler(),
                      ),
                      Text(
                        education.school,
                        style: WriteStyles.subtitleTabletandMobile(context)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        education.timeRange,
                        style: WriteStyles.body2(context),
                      ),
                      Text(
                        education.location,
                        style: WriteStyles.body2(context),
                      )
                    ],
                  )
                ],
              ),
              PortfolioDivider(
                  platformWidth: platformWidth, platformHeight: platformHeight)
            ],
          );
        case Platform.tablet:
          // FOR TABLET
          return Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      education.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  GlobalVariables.layoutSpaceSmaller(
                    platformHeight: platformHeight,
                    platformWidth: platformWidth,
                  ),
                  Column(
                    children: [
                      Text(
                        education.degree,
                        style: fontStyler(),
                      ),
                      Text(
                        education.school,
                        style: WriteStyles.subtitleTabletandMobile(context)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        education.timeRange,
                        style: WriteStyles.body2(context),
                      ),
                      Text(
                        education.location,
                        style: WriteStyles.body2(context),
                      )
                    ],
                  )
                ],
              ),
              PortfolioDivider(
                  platformWidth: platformWidth, platformHeight: platformHeight)
            ],
          );

        default:
          // FOR DESKTOP
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
                  GlobalVariables.layoutSpaceSmaller(
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
              GlobalVariables.layoutSpaceSmaller(
                platformHeight: platformHeight,
                platformWidth: platformWidth,
              ),
            ],
          );
      }
    }

    return layoutWidget();
  }
}
