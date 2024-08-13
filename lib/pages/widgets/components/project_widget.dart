import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/core/models/projects_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_strings.dart';
import '../../../core/providers/layout_provider.dart';

class ProjectWidget extends StatefulWidget {
  final ProjectModel projects;

  final double platformWidth;
  final double platformHeight;
  const ProjectWidget({
    super.key,
    required this.projects,
    required this.platformWidth,
    required this.platformHeight,
  });

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    final Uri githubLink = Uri.parse(widget.projects.projectLink);
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);
    TextStyle fontStyler() {
      switch (layoutProvider.currentPlatform) {
        case Platform.desktop:
          return WriteStyles.subtitleDesktop(context)
              .copyWith(fontWeight: FontWeight.bold);

        default:
          return WriteStyles.subtitleTabletandMobile(context)
              .copyWith(fontWeight: FontWeight.bold);
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

    return Material(
      shadowColor: Theme.of(context).colorScheme.secondary,
      elevation: 5,
      borderRadius: BorderRadius.circular(40),
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // decoration: BoxDecoration(
              //   color: Theme.of(context).colorScheme.inverseSurface,
              // ),
              width: widget.platformWidth * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.projects.projectTitle,
                    style: WriteStyles.header1Desktop(context),
                  ),
                  Text(
                    widget.projects.projectDescription,
                    style: WriteStyles.body1Desktop(context),
                  ),
                  GlobalVariables.layoutSpaceMedium(
                      platformHeight: widget.platformHeight,
                      platformWidth: widget.platformWidth),
                  Wrap(
                    spacing: 20,
                    runSpacing: widget.platformHeight * 0.02,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children: widget.projects.projectStack.map((stack) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(stack),
                      );
                    }).toList(),
                  ),
                  GlobalVariables.layoutSpaceLarge(
                      platformHeight: widget.platformHeight,
                      platformWidth: widget.platformWidth),
                  TextButton(
                    onPressed: () async {
                      if (await canLaunchUrl(githubLink)) {
                        await launchUrl(githubLink,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch ${Content.githubLink}';
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 145,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('View Github',
                              style: WriteStyles.body1Desktop(context).copyWith(
                                  color:
                                      Theme.of(context).colorScheme.surface)),
                          Icon(
                            Icons.open_in_new_rounded,
                            color: Theme.of(context).colorScheme.surface,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // IMAGE CAROUSEL
            SizedBox(
              width: widget.platformWidth * 0.3,
              height: widget.platformHeight * 0.7,
              child: CarouselSlider(
                items: widget.projects.projectImage.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: widget.platformWidth * 0.3,
                          maxHeight: widget.platformHeight * 0.7,
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
