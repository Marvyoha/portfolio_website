import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/app_constants.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_strings.dart';
import '../../core/providers/theme_provider.dart';
import '../widgets/about_me_content.dart';
import '../widgets/home_content.dart';
import '../widgets/project_content.dart';
import '../widgets/qualifications_content.dart';
import '../widgets/skills_content.dart';

class HomepageDesktop extends StatefulWidget {
  final double platformWidth;
  final double platformHeight;
  const HomepageDesktop({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  State<HomepageDesktop> createState() => _HomepageDesktopState();
}

class _HomepageDesktopState extends State<HomepageDesktop> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool onLastPage = false;

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          Content.name,
          style: WriteStyles.header3Desktop(context),
        ),
        actions: [
          TextButton(
            child: Text('Home', style: WriteStyles.body1Desktop(context)),
            onPressed: () {
              _controller.animateToPage(0,
                  duration: const Duration(milliseconds: 780),
                  curve: Curves.easeOut);
            },
          ),
          GlobalVariables.spaceSmaller(isWidth: true),
          TextButton(
            child: Text('About Me', style: WriteStyles.body1Desktop(context)),
            onPressed: () {
              _controller.animateToPage(1,
                  duration: const Duration(milliseconds: 780),
                  curve: Curves.easeOut);
            },
          ),
          GlobalVariables.spaceSmaller(isWidth: true),
          TextButton(
            child: Text('Qualifications',
                style: WriteStyles.body1Desktop(context)),
            onPressed: () {
              _controller.animateToPage(2,
                  duration: const Duration(milliseconds: 780),
                  curve: Curves.easeOut);
            },
          ),
          GlobalVariables.spaceSmaller(isWidth: true),
          TextButton(
            child: Text('Skills', style: WriteStyles.body1Desktop(context)),
            onPressed: () {
              _controller.animateToPage(3,
                  duration: const Duration(milliseconds: 780),
                  curve: Curves.easeOut);
            },
          ),
          GlobalVariables.spaceSmaller(isWidth: true),
          TextButton(
            child: Text('Projects', style: WriteStyles.body1Desktop(context)),
            onPressed: () {
              _controller.animateToPage(4,
                  duration: const Duration(milliseconds: 780),
                  curve: Curves.easeOut);
            },
          ),
          GlobalVariables.spaceMedium(isWidth: true),
          IconButton(
            icon: Icon(
                themeProvider.isLight ? CarbonIcons.sun : CarbonIcons.moon),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false)
                  .toggleTheme(context);
            },
          ),
          GlobalVariables.spaceSmaller(isWidth: true),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(36),
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () async {
                if (await canLaunchUrl(Content.cvLink)) {
                  await launchUrl(Content.cvLink,
                      mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch ${Content.cvLink}';
                }
              },
              child: Text('View CV',
                  style: WriteStyles.body1Desktop(context)
                      .copyWith(color: Theme.of(context).colorScheme.surface)),
            ),
          ),
        ],
      ),
      body: PageView(
        pageSnapping: false,
        scrollBehavior: const ScrollBehavior(),
        scrollDirection: Axis.vertical,
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            onLastPage = (value == 4);
          });
        },
        children: [
          HomeContents(
              platformHeight: widget.platformHeight,
              platformWidth: widget.platformWidth),
          const AboutMeContent(),
          const QualificationsContent(),
          const SkillsContent(),
          const ProjectContent()
        ],
      ),
    );
  }
}
