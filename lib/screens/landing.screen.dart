import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/main.dart';
import 'package:frontend_job_recruitment/models/master.model.dart';
import 'package:frontend_job_recruitment/pages/landing.page.dart';
import 'package:frontend_job_recruitment/widgets/head_bar.widget.dart';

class Landing extends ConsumerStatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingState();
}

class _LandingState extends ConsumerState<Landing> {
  Master? master;
  Provider<_Pages> pageProvider = Provider<_Pages>((ref) {
    _Pages page = _Pages.landing;
    return page;
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    master = ref.read(masterProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: HeadBar(scaffold: _scaffoldKey.currentState),
      extendBodyBehindAppBar: true,
      endDrawer: Container(),
      body: LayoutBuilder(builder: (context, box) {
        _Pages page = ref.read(pageProvider);
        switch (page) {
          case _Pages.landing:
            return LandingPage(box: box);
        }
      }),
    );
  }
}

enum _Pages { landing }
