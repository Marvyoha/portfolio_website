import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/models/skills_model.dart';
import '../../../core/providers/layout_provider.dart';

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
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            skills.icon,
            size: layoutProvider.currentPlatform == Platform.desktop ? 70 : 60,
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
