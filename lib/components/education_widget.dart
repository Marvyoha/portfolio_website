import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';

import '../constants/app_fonts.dart';

class EducationWidget extends StatelessWidget {
  final String image;
  final String degree;
  final String school;
  final String timeRange;
  final String location;
  final double platformWidth;
  final double platformHeight;
  const EducationWidget({
    super.key,
    required this.degree,
    required this.school,
    required this.timeRange,
    required this.location,
    required this.image,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.blue,
          height: 100,
          width: 100,
        ),
        GlobalVariables.desktopSpaceSmaller(
            platformHeight: platformHeight,
            platformWidth: platformWidth,
            isWidth: true),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              degree,
              style: WriteStyles.subtitleDesktop(context),
            ),
            Text(
              school,
              style: WriteStyles.body2(context),
            ),
            Text(
              timeRange,
              style: WriteStyles.body2(context),
            ),
            Text(
              location,
              style: WriteStyles.body2(context),
            )
          ],
        )
      ],
    );
  }
}
