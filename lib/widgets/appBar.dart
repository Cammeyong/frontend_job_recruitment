import 'package:flutter/material.dart';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class AmberAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AmberAppBar({super.key, required GlobalKey<ScaffoldState> scaffoldKey});

  @override
  Size get preferredSize => const Size.fromHeight(30);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var widget;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Image.asset(
        'images/amber-employ-white.png',
        height: 10.0,
        width: 10.0,
        // fit: BoxFit.cover,
      ),
      actions: <Widget>[
        ElevatedButton.icon(
          icon: const Icon(Icons.person),
          label: const Text(''),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.menu),
          label: const Text(''),
          onPressed: () {
            widget.scaffoldKey.currentState!.openEndDrawer();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
    // const Drawer(),
  }
}
