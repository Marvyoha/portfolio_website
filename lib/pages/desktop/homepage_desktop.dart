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
  final ScrollController _scrollController = ScrollController();

  // Keys for each section
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _qualificationsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext!;
    Scrollable.ensureVisible(context,
        duration: const Duration(milliseconds: 780), curve: Curves.easeOut);
  }

  void _scrollToIndex(int index) {
    double offset = 0.0;
    switch (index) {
      case 0:
        offset = 0.0;
        break;
      case 1:
        offset = widget.platformHeight;
        break;
      case 2:
        offset = widget.platformHeight * 2;
        break;
      case 3:
        offset = widget.platformHeight * 3;
        break;
      case 4:
        offset = widget.platformHeight * 4;
        break;
    }
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

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
            onPressed: () => _scrollToIndex(0),
          ),
          GlobalVariables.spaceSmaller(isWidth: true),
          TextButton(
            child: Text('About Me', style: WriteStyles.body1Desktop(context)),
            onPressed: () => _scrollToSection(_aboutMeKey),
          ),
          GlobalVariables.spaceSmaller(isWidth: true),
          TextButton(
            child: Text('Qualifications',
                style: WriteStyles.body1Desktop(context)),
            onPressed: () => _scrollToSection(_qualificationsKey),
          ),
          GlobalVariables.spaceSmaller(isWidth: true),
          TextButton(
            child: Text('Skills', style: WriteStyles.body1Desktop(context)),
            onPressed: () => _scrollToSection(_skillsKey),
          ),
          GlobalVariables.spaceSmaller(isWidth: true),
          TextButton(
            child: Text('Projects', style: WriteStyles.body1Desktop(context)),
            onPressed: () => _scrollToIndex(4),
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
      body: ListView(
        controller: _scrollController,
        children: [
          Container(
            key: _homeKey,
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: GlobalVariables.desktopPadding,
              child: HomeContents(
                  platformHeight: widget.platformHeight,
                  platformWidth: widget.platformWidth),
            ),
          ),
          Center(
            child: Container(
              key: _aboutMeKey,
              // height: widget.platformHeight * 0.8,
              color: Theme.of(context).colorScheme.inverseSurface,
              child: Padding(
                padding: GlobalVariables.desktopPaddingMain,
                child: AboutMeContent(
                    platformHeight: widget.platformHeight,
                    platformWidth: widget.platformWidth),
              ),
            ),
          ),
          Center(
            child: Container(
              key: _qualificationsKey,
              color: Theme.of(context).colorScheme.surface,
              child: Padding(
                padding: GlobalVariables.desktopPaddingMain,
                child: QualificationsContent(
                    platformWidth: widget.platformWidth,
                    platformHeight: widget.platformHeight),
              ),
            ),
          ),
          Center(
            child: Container(
              key: _skillsKey,
              color: Theme.of(context).colorScheme.inverseSurface,
              child: Padding(
                padding: GlobalVariables.desktopPaddingMain,
                child: SkillsContent(
                    platformWidth: widget.platformWidth,
                    platformHeight: widget.platformHeight),
              ),
            ),
          ),
          Center(
              child: Container(
            key: _projectsKey,
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: GlobalVariables.desktopPaddingMain,
              child: ProjectContent(
                  platformWidth: widget.platformWidth,
                  platformHeight: widget.platformHeight),
            ),
          ))
        ],
      ),
    );
  }
}
