import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/app_constants.dart';
import 'package:my_portfolio_website/core/models/certificates_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constants/app_fonts.dart';
import '../../../../../core/providers/layout_provider.dart';

class CertificatesWidget extends StatelessWidget {
  final CertificatesModel cert;

  final double platformWidth;
  final double platformHeight;
  const CertificatesWidget({
    super.key,
    required this.cert,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  Widget build(BuildContext context) {
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);

    TextStyle fontStyler() {
      switch (layoutProvider.currentPlatform) {
        case Platform.desktop:
          return WriteStyles.subtitleDesktop(context);

        default:
          return WriteStyles.subtitleTabletandMobile(context);
      }
    }

    // * Implement when needed on the spacer
    TextStyle layoutSpacer() {
      switch (layoutProvider.currentPlatform) {
        case Platform.mobile:
          return WriteStyles.header1Mobile(context);
        case Platform.tablet:
          return WriteStyles.header1Tablet(context);

        default:
          return WriteStyles.header1Desktop(context);
      }
    }

    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            cert.image,
            fit: BoxFit.fill,
          ),
        ),
        GlobalVariables.layoutSpaceSmaller(
            platformHeight: platformHeight,
            platformWidth: platformWidth,
            isWidth: true),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: platformWidth * 0.25,
              child: Text(
                cert.course,
                style: fontStyler(),
              ),
            ),
            SizedBox(
              width: platformWidth * 0.25,
              child: Text(
                'Issued by ${cert.issuedBy}',
                style: WriteStyles.body2(context),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (await canLaunchUrl(cert.viewCredential)) {
                  await launchUrl(cert.viewCredential,
                      mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch ${cert.viewCredential}';
                }
              },
              child: SizedBox(
                width: platformWidth * 0.25,
                child: Text(
                  'View Credential',
                  style: WriteStyles.body2(context)
                      .copyWith(color: Theme.of(context).colorScheme.outline),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
