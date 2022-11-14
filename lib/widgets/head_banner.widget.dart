import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/utils/colors.dart';

class HeadBanner extends StatelessWidget {
  final bool applyButton;

  const HeadBanner({Key? key, required this.applyButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset('images/search.jpg').image,
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        Opacity(
          opacity: 0.6,
          child: Container(
            width: double.infinity,
            height: 300,
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
              applyButton
                  ? MaterialButton(
                      color: paletteMagenta,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      child: const Text(
                        'APPLY',
                        style: TextStyle(color: Colors.white, letterSpacing: 4),
                      ),
                    )
                  : Container(),
            ],
          ),
        )
      ],
    );
  }
}
