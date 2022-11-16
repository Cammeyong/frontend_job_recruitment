import 'package:flutter/material.dart';

class HeadBar extends AppBar {
  final ScaffoldState? scaffold;
  final Function callback;
  HeadBar({Key? key, required this.scaffold, required this.callback})
      : super(
            key: key,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset('images/amber-employ-white.png'),
            ),
            leadingWidth: 120,
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  onPressed: () {
                    callback();
                  },
                  icon: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  onPressed: () {
                    scaffold?.openEndDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 16)),
            ]);
}
