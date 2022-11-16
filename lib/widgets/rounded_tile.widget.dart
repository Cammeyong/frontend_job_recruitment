import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/utils/colors.dart';
import 'package:frontend_job_recruitment/utils/text_styles.dart';

class RoundedTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool leading;

  const RoundedTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.leading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: 4, vertical: 4),
      leading: leading
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blueGrey.withOpacity(0.225),
              ),
              padding: const EdgeInsets.all(4.0),
              child: Icon(icon, size: 50, color: paletteMagenta),
            )
          : null,
      trailing: !leading
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blueGrey.withOpacity(0.225),
              ),
              padding: const EdgeInsets.all(4.0),
              child: Icon(icon, size: 50, color: paletteMagenta),
            )
          : null,
      tileColor: Colors.blueGrey.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      title: Center(
        child: Text(
          title,
          style: subTitleStyle.merge(
            const TextStyle(letterSpacing: 4),
          ),
        ),
      ),
      subtitle: Center(child: Text(subtitle, style: const TextStyle(fontSize: 12))),
    );
  }
}
