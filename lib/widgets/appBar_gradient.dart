import 'package:flutter/material.dart';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class AmberAppBarGradient extends StatelessWidget implements PreferredSizeWidget {
  const AmberAppBarGradient({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
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
            scaffoldKey.currentState?.openEndDrawer();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
      flexibleSpace: Container(
        decoration:const BoxDecoration(
          gradient:LinearGradient(
            colors: [Color.fromARGB(255, 92, 99, 177), Color.fromARGB(255, 183, 73, 162)]
          )
        )
      )
    );
    
  }
}
