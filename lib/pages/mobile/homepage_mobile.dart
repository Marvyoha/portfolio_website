import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/providers/theme_provider.dart';

class HomepageMobile extends StatefulWidget {
  final double platformWidth;
  final double platformHeight;
   const HomepageMobile({super.key, required this.platformWidth, required this.platformHeight});

  @override
  State<HomepageMobile> createState() => _HomepageMobileState();
}

class _HomepageMobileState extends State<HomepageMobile> {
 final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: IconButton(onPressed: (){   Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(context);}, icon:const Icon(Icons.light)),),
      body:  SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView(
            pageSnapping: false,
            scrollBehavior:const ScrollBehavior(),
            scrollDirection: Axis.vertical,
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 2);
              });
            },
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
             Container(
                width: 200,
                height: 200,
                color: Colors.yellow,
              ),
                 Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ],
          ),
        ),
    ),);
  }
}