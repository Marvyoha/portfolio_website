import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_portfolio_website/pages/widgets/get_in_touch_content.dart';
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
  final GlobalKey _getInTouchKey = GlobalKey();
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext!;
    Scrollable.ensureVisible(context,
        duration: const Duration(milliseconds: 780), curve: Curves.easeOut);
  }

  // void _scrollToIndex(int index) {
  //   double offset = 0.0;
  //   switch (index) {
  //     case 0:
  //       offset = 0.0;
  //       break;
  //     case 1:
  //       offset = widget.platformHeight;
  //       break;
  //     case 2:
  //       offset = widget.platformHeight * 2;
  //       break;
  //     case 3:
  //       offset = widget.platformHeight * 3;
  //       break;
  //     case 4:
  //       offset = widget.platformHeight * 4;
  //       break;
  //     case 5:
  //       offset = widget.platformHeight * 5;
  //       break;
  //   }
  //   _scrollController.animateTo(
  //     offset,
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool onLastPage = false;

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // appBar: AppBar(
      //   title:
      //   actions: [
      //     // TextButton(
      //     //     child: Text('Home', style: WriteStyles.body1Desktop(context)),
      //     //     onPressed: () => _scrollToSection(_homeKey)),
      //     // GlobalVariables.spaceSmaller(isWidth: true),
      //     // TextButton(
      //     //   child: Text('About Me', style: WriteStyles.body1Desktop(context)),
      //     //   onPressed: () => _scrollToSection(_aboutMeKey),
      //     // ),
      //     // GlobalVariables.spaceSmaller(isWidth: true),
      //     // TextButton(
      //     //   child: Text('Qualifications',
      //     //       style: WriteStyles.body1Desktop(context)),
      //     //   onPressed: () => _scrollToSection(_qualificationsKey),
      //     // ),
      //     // GlobalVariables.spaceSmaller(isWidth: true),
      //     // TextButton(
      //     //   child: Text('Skills', style: WriteStyles.body1Desktop(context)),
      //     //   onPressed: () => _scrollToSection(_skillsKey),
      //     // ),
      //     // GlobalVariables.spaceSmaller(isWidth: true),
      //     // TextButton(
      //     //   child: Text('Projects', style: WriteStyles.body1Desktop(context)),
      //     //   onPressed: () => _scrollToSection(_projectsKey),
      //     // ),
      //   ],
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 10, 100, 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Content.name,
                  style: WriteStyles.header3Desktop(context),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(themeProvider.isLight
                          ? CarbonIcons.sun
                          : CarbonIcons.moon),
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
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
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
                            style: WriteStyles.body1Desktop(context).copyWith(
                                color: Theme.of(context).colorScheme.surface)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            child: ListView(
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
                Container(
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
                Container(
                  key: _qualificationsKey,
                  color: Theme.of(context).colorScheme.surface,
                  child: Padding(
                    padding: GlobalVariables.desktopPaddingMain,
                    child: QualificationsContent(
                        platformWidth: widget.platformWidth,
                        platformHeight: widget.platformHeight),
                  ),
                ),
                Container(
                  key: _skillsKey,
                  color: Theme.of(context).colorScheme.inverseSurface,
                  child: Padding(
                    padding: GlobalVariables.desktopPaddingMain,
                    child: SkillsContent(
                        platformWidth: widget.platformWidth,
                        platformHeight: widget.platformHeight),
                  ),
                ),
                Container(
                  key: _projectsKey,
                  color: Theme.of(context).colorScheme.surface,
                  child: Padding(
                    padding: GlobalVariables.desktopPaddingMain,
                    child: ProjectContent(
                        platformWidth: widget.platformWidth,
                        platformHeight: widget.platformHeight),
                  ),
                ),
                Container(
                  key: _getInTouchKey,
                  color: Theme.of(context).colorScheme.inverseSurface,
                  child: Padding(
                    padding: GlobalVariables.desktopPaddingMain,
                    child: GetInTouchContent(
                        platformWidth: widget.platformWidth,
                        platformHeight: widget.platformHeight),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
