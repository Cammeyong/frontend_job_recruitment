import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Button1 extends StatelessWidget {
  final VoidCallback callback;
  final String title;

  const Button1({Key? key, required this.title, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: MaterialButton(
        clipBehavior: Clip.antiAlias,
        color: paletteMagenta,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: callback,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, letterSpacing: 4),
        ),
      ),
    );
  }
}
