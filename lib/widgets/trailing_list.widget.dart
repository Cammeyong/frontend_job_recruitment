import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/text_styles.dart';

class TrailingList extends StatelessWidget {
  final String title;
  final List<String> trail;

  const TrailingList({Key? key, required this.title, required this.trail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'ABOUT',
          style: subTitleStyle.merge(
            TextStyle(color: paletteMagenta, letterSpacing: 3),
          ),
        ),
        ...trail.map((e) =>
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                e,
                style: bodyStyle2.merge(const TextStyle(letterSpacing: 2)),
              ),
            )).toList(),
      ],
    );
  }
}
