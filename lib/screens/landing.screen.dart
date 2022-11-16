import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/models/master.model.dart';
import 'package:frontend_job_recruitment/pages/landing.page.dart';
import 'package:frontend_job_recruitment/pages/landing_drawer.page.dart';
import 'package:frontend_job_recruitment/pages/login.page.dart';
import 'package:frontend_job_recruitment/pages/registration.page.dart';
import 'package:frontend_job_recruitment/providers/landing_pages.provider.dart';
import 'package:frontend_job_recruitment/providers/master.provider.dart';
import 'package:frontend_job_recruitment/widgets/head_bar.widget.dart';

class Landing extends ConsumerStatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingState();
}

class _LandingState extends ConsumerState<Landing> {
  Master? master;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    master = ref.read(masterProvider);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(landingPagesProvider, (previous, next) {
      if (previous != next) setState(() {});
    });
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: HeadBar(
          scaffold: _scaffoldKey.currentState,
          callback: () {
            ref.watch(landingPagesProvider.notifier).setPage(LandingPages.login);
          },
        ),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        endDrawer: LayoutBuilder(builder: (context, box) => LandingDrawer(box: box)),
        body: LayoutBuilder(builder: (context, box) {
          LandingPages pageSelector = ref.watch(landingPagesProvider);
          switch (pageSelector) {
            case LandingPages.landing:
              return LandingPage(box: box);
            case LandingPages.registration:
              return RegistrationPage(box: box);
            case LandingPages.login:
              return LoginPage(box: box);
            case LandingPages.userProfile:
              return Container();
            case LandingPages.companyProfile:
              return Container();
          }
        }),
      ),
    );
  }
}

enum LandingPages { landing, registration, login, userProfile, companyProfile }
