import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_fonts.dart';
import 'package:provider/provider.dart';

import '../../core/providers/theme_provider.dart';

class HomepageDesktop extends StatelessWidget {
  final double platformWidth;
  final double platformHeight;
  const HomepageDesktop({super.key, required this.platformWidth, required this.platformHeight});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: IconButton(onPressed: (){   Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(context);}, icon:const Icon(Icons.light)),),
      body:  Center(child: Column(
      children: [
        Text('The current width is: $platformWidth x $platformHeight',style: WriteStyles.header2TabletandMobile(context),) ,
        Text('Desktop',style: WriteStyles.header1Desktop(context),),
        Container(color: Theme.of(context).colorScheme.primary,
        height: platformHeight*0.2,
        width: platformWidth*0.6,)
      ],
    ),),);
  }
}