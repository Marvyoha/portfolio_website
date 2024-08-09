import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/app_fonts.dart';
import '../../../../../core/providers/layout_provider.dart';

class SectionHeader extends StatelessWidget {
  final String content;
  const SectionHeader({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);

    TextStyle fontStyler() {
      switch (layoutProvider.currentPlatform) {
        case Platform.desktop:
          return WriteStyles.header2Desktop(context);

        default:
          return WriteStyles.header2TabletandMobile(context);
      }
    }

    return Text(
      content,
      style: fontStyler(),
    );
  }
}

// class SectionHeader extends StatelessWidget {
//   final String content;
//   const SectionHeader({
//     super.key,
//     required this.content,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(5),
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.tertiary,
//           borderRadius: BorderRadius.circular(20)),
//       child: Text(
//         content,
//         style: WriteStyles.body3(context),
//       ),
//     );
//   }
// }
