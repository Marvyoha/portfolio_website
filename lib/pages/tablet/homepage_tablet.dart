// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
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

class HomepageTablet extends StatefulWidget {
  final double platformWidth;
  final double platformHeight;
  const HomepageTablet({
    super.key,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  State<HomepageTablet> createState() => _HomepageTabletState();
}

class _HomepageTabletState extends State<HomepageTablet> {
  // final PageController _controller = PageController();
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
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Content.name,
                    style: WriteStyles.header3TabletandMobile(context),
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
                              style: WriteStyles.body1TabletandMobile(context)
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: GlobalVariables.drawerPadding,
                child: ListView(
                  children: [
                    Container(
                      color: Theme.of(context).colorScheme.surface,
                      padding: GlobalVariables.tabletPadding,
                      child: HomeContents(
                          platformHeight: widget.platformHeight,
                          platformWidth: widget.platformWidth),
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      padding: GlobalVariables.tabletPaddingMain,
                      child: AboutMeContent(
                          platformHeight: widget.platformHeight,
                          platformWidth: widget.platformWidth),
                    ),
                    Container(
                      padding: GlobalVariables.tabletPaddingMain,
                      color: Theme.of(context).colorScheme.surface,
                      child: QualificationsContent(
                          platformHeight: widget.platformHeight,
                          platformWidth: widget.platformWidth),
                    ),
                    Container(
                      padding: GlobalVariables.tabletPaddingMain,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      child: SkillsContent(
                          platformHeight: widget.platformHeight,
                          platformWidth: widget.platformWidth),
                    ),
                    Container(
                      padding: GlobalVariables.tabletPaddingMain,
                      color: Theme.of(context).colorScheme.surface,
                      child: ProjectContent(
                          platformHeight: widget.platformHeight,
                          platformWidth: widget.platformWidth),
                    ),
                    Container(
                      padding: GlobalVariables.tabletPaddingMain,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      child: GetInTouchContent(
                          platformHeight: widget.platformHeight,
                          platformWidth: widget.platformWidth),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // drawer: _buildDrawer(context, themeProvider,
      //     platformWidth: widget.platformWidth),
    );
  }

  Future<void> _handleRefresh() async {
    if (_isRefreshing) return;
    setState(() {
      _isRefreshing = true;
    });

    try {
      // Simulate a network request or data reload
      await Future.delayed(const Duration(seconds: 1));

      // Reload the entire page
      html.window.location.reload();
    } finally {
      setState(() {
        _isRefreshing = false;
      });
    }
  }

//   Widget _buildDrawer(BuildContext context, ThemeProvider themeProvider,
//       {required double platformWidth}) {
//     return Drawer(
//       child: Padding(
//         padding: GlobalVariables.drawerPadding,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             AppBar(
//               automaticallyImplyLeading: false,
//               toolbarHeight: 30,
//             ),
//             // ListTile(
//             //   shape: const RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.all(Radius.circular(20))),
//             //   title: Text('Home',
//             //       style: WriteStyles.body1TabletandMobile(context)),
//             //   onTap: () {
//             //     Navigator.pop(context);
//             //     _controller.animateToPage(0,
//             //         duration: const Duration(milliseconds: 780),
//             //         curve: Curves.easeOut);
//             //   },
//             // ),
//             // GlobalVariables.spaceSmaller(),
//             // ListTile(
//             //   shape: const RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.all(Radius.circular(20))),
//             //   title: Text('About Me',
//             //       style: WriteStyles.body1TabletandMobile(context)),
//             //   onTap: () {
//             //     Navigator.pop(context);
//             //     _controller.animateToPage(1,
//             //         duration: const Duration(milliseconds: 780),
//             //         curve: Curves.easeOut);
//             //   },
//             // ),
//             // GlobalVariables.spaceSmaller(),
//             // ListTile(
//             //   shape: const RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.all(Radius.circular(20))),
//             //   title: Text('Qualifications',
//             //       style: WriteStyles.body1TabletandMobile(context)),
//             //   onTap: () {
//             //     Navigator.pop(context);
//             //     _controller.animateToPage(2,
//             //         duration: const Duration(milliseconds: 780),
//             //         curve: Curves.easeOut);
//             //   },
//             // ),
//             // GlobalVariables.spaceSmaller(),
//             // ListTile(
//             //   shape: const RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.all(Radius.circular(20))),
//             //   title: Text('Skills',
//             //       style: WriteStyles.body1TabletandMobile(context)),
//             //   onTap: () {
//             //     Navigator.pop(context);
//             //     _controller.animateToPage(3,
//             //         duration: const Duration(milliseconds: 780),
//             //         curve: Curves.easeOut);
//             //   },
//             // ),
//             // GlobalVariables.spaceSmaller(),
//             // ListTile(
//             //   shape: const RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.all(Radius.circular(20))),
//             //   title: Text('Projects',
//             //       style: WriteStyles.body1TabletandMobile(context)),
//             //   onTap: () {
//             //     Navigator.pop(context);
//             //     _controller.animateToPage(4,
//             //         duration: const Duration(milliseconds: 780),
//             //         curve: Curves.easeOut);
//             //   },
//             // ),
//             GlobalVariables.spaceSmaller(),
//             ListTile(
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//               leading: Text('Theme',
//                   style: WriteStyles.body1TabletandMobile(context)),
//               trailing: Icon(
//                   themeProvider.isLight ? CarbonIcons.sun : CarbonIcons.moon),
//               onTap: () {
//                 Provider.of<ThemeProvider>(context, listen: false)
//                     .toggleTheme(context);
//                 Navigator.pop(context);
//               },
//             ),
//             GlobalVariables.spaceSmaller(),
//             ListTile(
//               tileColor: Theme.of(context).colorScheme.primary,
//               onTap: () async {
//                 if (await canLaunchUrl(Content.cvLink)) {
//                   await launchUrl(Content.cvLink,
//                       mode: LaunchMode.externalApplication);
//                   Navigator.pop(context);
//                 } else {
//                   throw 'Could not launch ${Content.cvLink}';
//                 }
//               },
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//               title: Text('View CV',
//                   style: WriteStyles.body1TabletandMobile(context)
//                       .copyWith(color: Theme.of(context).colorScheme.surface)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
}
