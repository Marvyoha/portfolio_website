import 'package:carbon_icons/carbon_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_website/core/models/projects_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/app_constants.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_strings.dart';
import '../../../core/providers/layout_provider.dart';

class ProjectWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final Uri githubLink = Uri.parse(projects.projectLink);
    LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: true);

    // * Implement when needed on the spacer
    Widget layoutWidget() {
      switch (layoutProvider.currentPlatform) {
        case Platform.mobile:
          // FOR MOBILE
          return Material(
            shadowColor: Theme.of(context).colorScheme.secondary,
            elevation: 2,
            borderRadius: BorderRadius.circular(40),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // IMAGE CAROUSEL
                  CarouselSlider(
                    items: projects.projectImage.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            image,
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: platformHeight * 0.4,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                  ),
                  GlobalVariables.layoutSpaceMedium(
                      platformHeight: platformHeight,
                      platformWidth: platformWidth),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projects.projectTitle,
                        style: WriteStyles.header1Mobile(context),
                      ),
                      Text(
                        projects.projectDescription,
                        style: WriteStyles.body1TabletandMobile(context),
                      ),
                      GlobalVariables.layoutSpaceMedium(
                          platformHeight: platformHeight,
                          platformWidth: platformWidth),
                      Wrap(
                        spacing: 4,
                        runSpacing: platformHeight * 0.02,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: projects.projectStack.map((stack) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 7),
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              stack,
                              style: WriteStyles.body3(context),
                            ),
                          );
                        }).toList(),
                      ),
                      GlobalVariables.layoutSpaceMedium(
                          platformHeight: platformHeight,
                          platformWidth: platformWidth),
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
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('View Source Code',
                                  style:
                                      WriteStyles.body1TabletandMobile(context)
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .surface)),
                              Icon(
                                CarbonIcons.logo_github,
                                color: Theme.of(context).colorScheme.surface,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        case Platform.tablet:
          // FOR TABLET
          return Material(
            shadowColor: Theme.of(context).colorScheme.secondary,
            elevation: 2,
            borderRadius: BorderRadius.circular(40),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // IMAGE CAROUSEL
                  CarouselSlider(
                    items: projects.projectImage.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            image,
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: platformHeight * 0.4,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                  ),
                  GlobalVariables.layoutSpaceMedium(
                      platformHeight: platformHeight,
                      platformWidth: platformWidth),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projects.projectTitle,
                        style: WriteStyles.header1Tablet(context),
                      ),
                      Text(
                        projects.projectDescription,
                        style: WriteStyles.body1TabletandMobile(context),
                      ),
                      GlobalVariables.layoutSpaceMedium(
                          platformHeight: platformHeight,
                          platformWidth: platformWidth),
                      Wrap(
                        spacing: 7,
                        runSpacing: platformHeight * 0.02,
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: projects.projectStack.map((stack) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 7),
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              stack,
                              style: WriteStyles.body3(context),
                            ),
                          );
                        }).toList(),
                      ),
                      GlobalVariables.layoutSpaceMedium(
                          platformHeight: platformHeight,
                          platformWidth: platformWidth),
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
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('View Source Code',
                                  style:
                                      WriteStyles.body1TabletandMobile(context)
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .surface)),
                              Icon(
                                CarbonIcons.logo_github,
                                color: Theme.of(context).colorScheme.surface,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );

        default:
          // FOR DESKTOP
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
                    width: platformWidth * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projects.projectTitle,
                          style: WriteStyles.header1Desktop(context),
                        ),
                        Text(
                          projects.projectDescription,
                          style: WriteStyles.body1Desktop(context),
                        ),
                        GlobalVariables.layoutSpaceMedium(
                            platformHeight: platformHeight,
                            platformWidth: platformWidth),
                        Wrap(
                          spacing: 7,
                          runSpacing: platformHeight * 0.02,
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          children: projects.projectStack.map((stack) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                stack,
                                style: WriteStyles.body3(context),
                              ),
                            );
                          }).toList(),
                        ),
                        GlobalVariables.layoutSpaceLarge(
                            platformHeight: platformHeight,
                            platformWidth: platformWidth),
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
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: 220,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('View Source Code',
                                    style: WriteStyles.body1Desktop(context)
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface)),
                                Icon(
                                  CarbonIcons.logo_github,
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
                    width: platformWidth * 0.26,
                    height: platformHeight * 0.7,
                    child: CarouselSlider(
                      items: projects.projectImage.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: platformWidth * 0.32,
                                maxHeight: platformHeight * 0.7,
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

    return layoutWidget();
  }
}
