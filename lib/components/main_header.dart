import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';

class MainHeader extends StatelessWidget {
  final String content;
  final double platformWidth;
  final double platformHeight;
  const MainHeader({
    super.key,
    required this.content,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(content, style: WriteStyles.header1Desktop(context)),
        // Stack(
        //   alignment: Alignment.bottomCenter,
        //   children: [
        //     Container(
        //       color: Theme.of(context).colorScheme.outline,
        //       height: platformHeight * 0.02,
        //       width: platformWidth * 0.05,
        //     ),
        //     Divider(
        //       color: Theme.of(context).colorScheme.outline,
        //       thickness: 3,
        //       height: 1,
        //       indent: platformWidth * 0.25,
        //       endIndent: platformWidth * 0.25,
        //     ),
        //   ],
        // )
      ],
    );
  }
}
