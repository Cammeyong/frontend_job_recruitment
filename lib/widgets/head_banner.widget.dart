import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_job_recruitment/providers/landing_pages.provider.dart';
import 'package:frontend_job_recruitment/screens/landing.screen.dart';
import 'package:frontend_job_recruitment/utils/colors.dart';
import 'package:frontend_job_recruitment/utils/text_styles.dart';
import 'package:frontend_job_recruitment/widgets/button1.widget.dart';

class HeadBanner extends ConsumerWidget {
  final String? title;

  const HeadBanner({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset('images/search.jpg').image,
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            color: Colors.transparent,
          ),
        ),
        Opacity(
          opacity: 0.6,
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                colors: [paletteIndigo, paletteMagenta],
                transform: const GradientRotation(-0.3),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'WE ',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      letterSpacing: 8,
                    ),
                  ),
                  Text(
                    ' CREATE',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Text(
                'OPPORTUNITIES',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              title == null
                  ? Button1(
                      title: 'APPLY',
                      callback: () {
                        ref.watch(landingPagesProvider.notifier).setPage(LandingPages.registration);
                      },
                    )
                  : Text(
                      title!,
                      style: titleStyle.merge(
                        const TextStyle(color: Colors.white),
                      ),
                    ),
            ],
          ),
        )
      ],
    );
  }
}
