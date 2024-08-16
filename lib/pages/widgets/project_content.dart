import 'package:flutter/material.dart';
import 'package:my_portfolio_website/pages/widgets/components/project_widget.dart';

import '../../constants/app_constants.dart';
import '../../constants/app_strings.dart';
import 'components/main_header.dart';

class ProjectContent extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const ProjectContent(
      {super.key, required this.platformWidth, required this.platformHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHeader(
            content: 'Projects',
            platformWidth: platformWidth,
            platformHeight: platformHeight),
        Column(
          children: Content.projectList
              .map((project) => Column(
                    children: [
                      ProjectWidget(
                        projects: project, // Changed to use 'project' directly
                        platformWidth: platformWidth,
                        platformHeight: platformHeight,
                      ),
                      GlobalVariables.layoutSpaceLarge(
                        platformHeight: platformHeight,
                        platformWidth: platformWidth,
                      ),
                    ],
                  ))
              .toList(), // Removed extra comma
        ),
      ],
    );
  }
}
