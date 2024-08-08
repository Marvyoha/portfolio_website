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

class HomepageMobile extends StatefulWidget {
  final double platformWidth;
  final double platformHeight;
  const HomepageMobile({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  State<HomepageMobile> createState() => _HomepageMobileState();
}

class _HomepageMobileState extends State<HomepageMobile> {
  final PageController _controller = PageController();
  bool _isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool onLastPage = false;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Content.name,
          style: WriteStyles.header2TabletandMobile(context),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Padding(
            padding: GlobalVariables.drawerPadding,
            child: PageView(
              pageSnapping: false,
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
                AboutMeContent(
                    platformHeight: widget.platformHeight,
                    platformWidth: widget.platformWidth),
                QualificationsContent(
                    platformHeight: widget.platformHeight,
                    platformWidth: widget.platformWidth),
                SkillsContent(
                    platformHeight: widget.platformHeight,
                    platformWidth: widget.platformWidth),
                ProjectContent(
                    platformHeight: widget.platformHeight,
                    platformWidth: widget.platformWidth)
              ],
            ),
          ),
        ),
      ),
      drawer: _buildDrawer(context, themeProvider),
    );
  }

  Future<void> _handleRefresh() async {
    if (_isRefreshing) return;
    setState(() {
      _isRefreshing = true;
    });

    try {
      // Simulate a network request or data reload
      await Future.delayed(const Duration(seconds: 2));

      // Reset to the first page
      await _controller.animateToPage(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

      // Reload data or perform other refresh actions here
      // For example, you might want to call methods to reload specific content:
      // await _reloadHomeContent();
      // await _reloadAboutMeContent();
      // ... and so on for other sections
    } finally {
      setState(() {
        _isRefreshing = false;
      });
    }
  }

  Widget _buildDrawer(BuildContext context, ThemeProvider themeProvider) {
    return Drawer(
      child: Padding(
        padding: GlobalVariables.drawerPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 30,
            ),
            ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text('Home',
                  style: WriteStyles.body1TabletandMobile(context)),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(0,
                    duration: const Duration(milliseconds: 780),
                    curve: Curves.easeOut);
              },
            ),
            GlobalVariables.spaceSmaller(),
            ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text('About Me',
                  style: WriteStyles.body1TabletandMobile(context)),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(1,
                    duration: const Duration(milliseconds: 780),
                    curve: Curves.easeOut);
              },
            ),
            GlobalVariables.spaceSmaller(),
            ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text('Qualifications',
                  style: WriteStyles.body1TabletandMobile(context)),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(2,
                    duration: const Duration(milliseconds: 780),
                    curve: Curves.easeOut);
              },
            ),
            GlobalVariables.spaceSmaller(),
            ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text('Skills',
                  style: WriteStyles.body1TabletandMobile(context)),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(3,
                    duration: const Duration(milliseconds: 780),
                    curve: Curves.easeOut);
              },
            ),
            GlobalVariables.spaceSmaller(),
            ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text('Projects',
                  style: WriteStyles.body1TabletandMobile(context)),
              onTap: () {
                Navigator.pop(context);
                _controller.animateToPage(4,
                    duration: const Duration(milliseconds: 780),
                    curve: Curves.easeOut);
              },
            ),
            GlobalVariables.spaceSmaller(),
            ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              leading: Text('Theme',
                  style: WriteStyles.body1TabletandMobile(context)),
              trailing: Icon(
                  themeProvider.isLight ? CarbonIcons.sun : CarbonIcons.moon),
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(context);
              },
            ),
            GlobalVariables.spaceSmaller(),
            ListTile(
              tileColor: Theme.of(context).colorScheme.primary,
              onTap: () async {
                if (await canLaunchUrl(Content.cvLink)) {
                  await launchUrl(Content.cvLink,
                      mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch ${Content.cvLink}';
                }
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text('View CV',
                  style: WriteStyles.body1TabletandMobile(context)
                      .copyWith(color: Theme.of(context).colorScheme.surface)),
            )
          ],
        ),
      ),
    );
  }
}
