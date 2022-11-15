import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/widgets/layout/spacers.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/about-hero.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 110,
                    top: 100,
                    child: Row(
                      children: const [
                        Text(
                          "ABOUT",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36, color: Colors.white),
                        ),
                        HorizontalSpacer(size: 8),
                        Text(
                          "US",
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 36, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Image.asset(
                'assets/images/about-image-1.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                textAlign: TextAlign.justify,
              ),
            ),
            const VerticalSpacer(size: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Image.asset(
                'assets/images/about-image-1.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
