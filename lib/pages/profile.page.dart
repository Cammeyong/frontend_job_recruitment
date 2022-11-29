import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/providers/user_pages.provider.dart';
import 'package:frontend_job_recruitment/utils/text_styles.dart';
import 'package:frontend_job_recruitment/widgets/head_banner.widget.dart';
import 'package:frontend_job_recruitment/widgets/rounded_tile.widget.dart';

import '../models/post.model.dart';
import '../utils/colors.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final BoxConstraints box;
  const ProfilePage({Key? key, required this.box}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(userPagesProvider, (previous, next) {
      if (previous != next) setState(() {});
    });
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 275),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const RoundedTile(
                          icon: Icons.person,
                          title: 'Simon D. Maxwell',
                          subtitle: 'sdevm@gmail.com',
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('History', style: subTitleStyle),
                            const Icon(Icons.history),
                          ],
                        ),
                        Column(
                          children: ['', '']
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: FutureBuilder(
                                    future: Post.get(e),
                                    builder: (context, snap) {
                                      if (snap.connectionState == ConnectionState.done) {
                                        if (snap.hasData) {
                                          return Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  snap.data!['data']['title'],
                                                  style: subTitleStyle,
                                                ),
                                                Text(snap.data!['data']['author']),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.cases_outlined),
                                                        Text(
                                                          snap.data!['data']['position'],
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Text('View Job'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Center(
                                            child: const Text(
                                                'We\'re sorry, there was an error loading your data.'),
                                          );
                                        }
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor: Colors.transparent,
                                            color: paletteMagenta,
                                            strokeWidth: 5,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const HeadBanner(title: 'Applicant Profile'),
      ],
    );
  }
}
