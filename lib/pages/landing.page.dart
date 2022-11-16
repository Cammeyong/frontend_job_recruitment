import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/utils/text_styles.dart';
import 'package:frontend_job_recruitment/widgets/footer.widget.dart';
import 'package:frontend_job_recruitment/widgets/head_banner.widget.dart';
import 'package:frontend_job_recruitment/widgets/rounded_tile.widget.dart';
import '../providers/landing_pages.provider.dart';
import '../screens/landing.screen.dart';
import '../widgets/button1.widget.dart';

class LandingPage extends ConsumerWidget {
  final BoxConstraints box;

  const LandingPage({Key? key, required this.box}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 300),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                      children: const [
                        RoundedTile(
                          icon: Icons.airplanemode_on_sharp,
                          title: 'GLOBAL STRATEGY',
                          subtitle: 'Lorem ipsum, dolor sit amet.',
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        RoundedTile(
                          icon: Icons.location_city_rounded,
                          title: 'GLOBAL STRATEGY',
                          subtitle: 'Lorem ipsum, dolor sit amet.',
                          leading: false,
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        RoundedTile(
                          icon: Icons.umbrella,
                          title: 'GLOBAL STRATEGY',
                          subtitle: 'Lorem ipsum, dolor sit amet.',
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        RoundedTile(
                          icon: Icons.list,
                          title: 'GLOBAL STRATEGY',
                          subtitle: 'Lorem ipsum, dolor sit amet.',
                          leading: false,
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  Image.asset(
                    'images/meeting-1.jpg',
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.center,
                        colors: [Colors.blueGrey.withOpacity(0.3), Colors.blueGrey.withOpacity(0)],
                        transform: const GradientRotation(pi/2),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'FIND THE RIGHT WORK FOR YOU',
                          style: subTitleStyle,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: bodyStyle,
                          textAlign: TextAlign.center,
                        ),
                        Button1(
                          title: 'APPLY',
                          callback: () {
                            ref
                                .watch(landingPagesProvider.notifier)
                                .setPage(LandingPages.registration);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Footer(box: box),
                ],
              ),
            ),
          ],
        ),
        const HeadBanner(applyButton: true),
      ],
    );
  }
}
