import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:my_portfolio_website/pages/widgets/components/project_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_constants.dart';
import '../../constants/app_strings.dart';
import '../../core/providers/layout_provider.dart';
import 'components/main_header.dart';

class ProjectContent extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const ProjectContent(
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
              'Projects for mobile.',
              style: WriteStyles.header1Mobile(context),
            ),
          );
        case Platform.tablet:
          return Center(
            child: Text(
              'Projects for tablet.',
              style: WriteStyles.header1Tablet(context),
            ),
          );
        case Platform.desktop:
          return DesktopProjects(
              platformWidth: platformWidth, platformHeight: platformHeight);
      }
    }

    return layoutChecker();
  }
}

class DesktopProjects extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const DesktopProjects({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainHeader(
            content: 'Projects',
            platformWidth: platformWidth,
            platformHeight: platformHeight),
        SizedBox(
          height: platformHeight * (Content.projectList.length - 0.3),
          child: ListView.builder(
            itemCount: Content.projectList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ProjectWidget(
                    projects: Content.projectList[index],
                    platformWidth: platformWidth,
                    platformHeight: platformHeight,
                  ),
                  GlobalVariables.layoutSpaceLarge(
                      platformHeight: platformHeight,
                      platformWidth: platformWidth),
                  GlobalVariables.layoutSpaceLarge(
                      platformHeight: platformHeight,
                      platformWidth: platformWidth)
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
