import 'package:dev_icons/dev_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/models/skills_model.dart';
import '../../core/providers/layout_provider.dart';
import 'components/main_header.dart';
import 'components/skills_widget.dart';

List<SkillsModel> skillsList = [
  SkillsModel(icon: DevIcons.dartPlain, skill: 'Dart'),
  SkillsModel(icon: DevIcons.flutterPlain, skill: 'Flutter'),
  SkillsModel(icon: DevIcons.javaPlain, skill: 'Java'),
  SkillsModel(icon: DevIcons.pythonPlain, skill: 'Python'),
  SkillsModel(icon: DevIcons.cplusplusPlain, skill: 'C++'),
  SkillsModel(icon: DevIcons.firebasePlain, skill: 'Firebase'),
  SkillsModel(icon: DevIcons.figmaPlain, skill: 'Figma')
];

class SkillsContent extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const SkillsContent(
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
              'Skills for mobile.',
              style: WriteStyles.header1Mobile(context),
            ),
          );
        case Platform.tablet:
          return Center(
            child: Text(
              'Skills for tablet.',
              style: WriteStyles.header1Tablet(context),
            ),
          );
        case Platform.desktop:
          return DesktopSkills(
            platformWidth: platformWidth,
            platformHeight: platformHeight,
          );
      }
    }

    return layoutChecker();
  }
}

class DesktopSkills extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const DesktopSkills({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          MainHeader(
              content: 'Skills',
              platformWidth: platformWidth,
              platformHeight: platformHeight),
          Wrap(
            spacing: 20, // Reduced spacing between items
            runSpacing: platformHeight * 0.02,
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            children: skillsList
                .map((skills) => SkillsWidget(
                    skills: skills,
                    platformWidth: platformWidth,
                    platformHeight: platformHeight))
                .toList(),
          ),
        ],
      ),
    );
  }
}
