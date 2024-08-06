import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:provider/provider.dart';

import '../core/providers/theme_provider.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: IconButton(onPressed: (){   Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(context);}, icon:const Icon(Icons.light)),),
      body: SafeArea(
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
      ),
      bottomSheet: Container(
        color: Theme.of(context).colorScheme.background,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            onLastPage
                ? const SizedBox()
                : TextButton(
                    onPressed: () {
                      _controller.animateTo(1300,  duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeOut);
                    },
                    child:  Text(
                      'Skip',
                    style: WriteStyles.body1TabletandMobile(context),
                  
                    )),
            onLastPage
                ? TextButton(
                    onPressed: () {
                  
                    },
                    child: const Text( 
                      'Done',
                    
                    ))
                : TextButton(
                    onPressed: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOut);
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Next',
                      
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 28,
                        )
                      ],
                    )),
          ],
        ),
      ),
    );
  }
}
