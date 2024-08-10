import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';

import '../../../core/models/skills_model.dart';

class SkillsWidget extends StatelessWidget {
  final SkillsModel skills;
  final double platformWidth;
  final double platformHeight;
  const SkillsWidget(
      {super.key,
      required this.skills,
      required this.platformWidth,
      required this.platformHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            skills.icon,
            size: 70,
          ),
          GlobalVariables.layoutSpaceSmaller(
              platformHeight: platformHeight, platformWidth: platformWidth),
          Text(
            skills.skill,
            style: WriteStyles.body2(context),
          ),
        ],
      ),
    );
  }
}
