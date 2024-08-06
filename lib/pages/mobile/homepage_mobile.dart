import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:my_portfolio_website/constants/app_strings.dart';
import 'package:provider/provider.dart';

import '../../core/providers/theme_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool onLastPage = false;
    var themeProvider = Provider.of<ThemeProvider>(context, listen: true);
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
        child: Padding(
          padding: GlobalVariables.normPadding,
          child: PageView(
            pageSnapping: false,
            scrollBehavior: const ScrollBehavior(),
            scrollDirection: Axis.vertical,
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 6);
              });
            },
            children: [
              Container(color: Colors.blue),
              Container(color: Colors.green),
              Container(color: Colors.yellow),
              Container(color: Colors.orange),
              Container(color: Colors.red),
            ],
          ),
        ),
      ),
      drawer: _buildDrawer(context, themeProvider),
    );
  }

  Widget _buildDrawer(BuildContext context, ThemeProvider themeProvider) {
    return Drawer(
      width: widget.platformWidth * 0.50,
      child: Padding(
        padding: GlobalVariables.drawerPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
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

                _controller.animateToPage(4,
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
                _controller.animateToPage(6,
                    duration: const Duration(milliseconds: 780),
                    curve: Curves.easeOut);
              },
            ),
            GlobalVariables.spaceSmaller(),
            ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Icon(
                  themeProvider.isLight ? CarbonIcons.sun : CarbonIcons.moon),
              leading: Text('Theme',
                  style: WriteStyles.body1TabletandMobile(context)),
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(context);
              },
            ),
            GlobalVariables.spaceSmaller(),
            ListTile(
              tileColor: Theme.of(context).colorScheme.primary,
              onTap: () {},
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
