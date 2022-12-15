import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/pages/landing.page.dart';
import 'package:frontend_job_recruitment/pages/profile.page.dart';
import 'package:frontend_job_recruitment/providers/user_pages.provider.dart';
import 'package:frontend_job_recruitment/widgets/head_bar.widget.dart';

import '../pages/user_drawer.page.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: HeadBar(
          scaffold: _scaffoldKey.currentState,
          callback: () {
            ref.watch(userPagesProvider.notifier).setPage(UserPages.profile);
          },
        ),
        endDrawer: LayoutBuilder(builder: (context, box) => UserDrawer(box: box)),
        body: LayoutBuilder(builder: (context, box) {
          UserPages pageSelector = ref.watch(userPagesProvider);
          switch (pageSelector) {
            case UserPages.profile:
              return ProfilePage(box: box);
            case UserPages.home:
              return LandingPage(box: box);
          }
        }),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}

enum UserPages { profile, home }
