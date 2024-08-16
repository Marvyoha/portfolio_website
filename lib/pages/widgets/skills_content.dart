import 'package:flutter/material.dart';

import '../../constants/app_strings.dart';
import 'components/main_header.dart';
import 'components/skills_widget.dart';

class SkillsContent extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const SkillsContent(
      {super.key, required this.platformWidth, required this.platformHeight});

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
            children: Content.skillsList
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
