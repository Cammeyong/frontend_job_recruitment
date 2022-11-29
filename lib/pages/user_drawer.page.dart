import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/providers/user_pages.provider.dart';
import 'package:frontend_job_recruitment/screens/user.screen.dart';
import 'package:frontend_job_recruitment/utils/colors.dart';
import 'package:frontend_job_recruitment/utils/text_styles.dart';

class LandingDrawer extends ConsumerWidget {
  final BoxConstraints box;

  const LandingDrawer({Key? key, required this.box}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: box.maxWidth * 0.7,
      height: box.maxHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Stack(
              children: [
                Image.asset(
                  'images/search.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: paletteIndigo
                      .withOpacity(
                    0.6,
                  )
                      .withRed(120),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Sign Out',
                              style: subTitleStyle.merge(TextStyle(color: Colors.white)),
                            ),
                            const Icon(
                              Icons.person_outline_sharp,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 10)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('AMBER EMPLOY', style: TextStyle(color: paletteIndigo)),
                IconButton(onPressed: () {}, icon: Icon(Icons.waving_hand, color: paletteIndigo))
              ],
            ),
          ),
          ...(['HOME', 'JOB LISTING', 'CONTACT US', 'ABOUT US', 'FAQ']
              .map((e) => TextButton(
            style: const ButtonStyle(
              alignment: Alignment.centerLeft,
            ),
            onPressed: () {
              switch (e) {
                case 'HOME':
                  ref.watch(userPagesProvider.notifier).setPage(UserPages.home);
                  Scaffold.of(context).closeEndDrawer();
              }
            },
            child: Text(e),
          ))
              .toList())
        ],
      ),
    );
  }
}