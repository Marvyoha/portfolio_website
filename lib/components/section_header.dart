import 'package:flutter/material.dart';

import '../constants/app_fonts.dart';

class SectionHeader extends StatelessWidget {
  final String content;
  const SectionHeader({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        content,
        style: WriteStyles.body3(context),
      ),
    );
  }
}
