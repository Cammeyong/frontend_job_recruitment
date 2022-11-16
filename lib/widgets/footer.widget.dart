import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/utils/text_styles.dart';
import 'package:frontend_job_recruitment/widgets/trailing_list.widget.dart';

import '../utils/colors.dart';

class Footer extends StatelessWidget {
  final BoxConstraints box;

  const Footer({Key? key, required this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: box.maxHeight - 320,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          colors: [
            paletteIndigo,
            Color.fromARGB(
              255,
              (paletteIndigo.red + paletteMagenta.red) ~/ 2,
              (paletteIndigo.green + paletteMagenta.green) ~/ 2,
              (paletteIndigo.blue + paletteMagenta.blue) ~/ 2,
            ),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'images/amber-employ-white.png',
                        width: 150,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: TrailingList(title: 'ABOUT', trail: [
                      'Job Listings',
                      'About',
                      'Contact Us',
                      'Terms of Use',
                      'FAQ',
                    ]),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.white,
            ),
            SizedBox(
              height: 150,
              child: Row(
                children: const [
                  Expanded(
                    child: TrailingList(
                      title: 'CANDIDATES',
                      trail: ['Learn More', 'Register', 'Search Jobs'],
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: TrailingList(
                      title: 'EMPLOYERS',
                      trail: ['Learn More', 'Post a Job', 'Search Resume'],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Divider(
              thickness: 2,
              color: Colors.white,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'FOLLOW US',
                    style: subTitleStyle.merge(TextStyle(color: paletteMagenta, letterSpacing: 3)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.whatsapp,
                        color: Colors.white,
                        size: 50,
                      ),
                      Icon(
                        Icons.tiktok,
                        color: Colors.white,
                        size: 50,
                      ),
                      Icon(
                        Icons.facebook,
                        color: Colors.white,
                        size: 50,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
