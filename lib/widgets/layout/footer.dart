import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        gradient: RadialGradient(
          radius: 2,
          colors: [Color(0xFF262D5C), Color(0xFF372859)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/logo.png"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "FOLLOW US",
              style: TextStyle(color: Color(0xFFB749A2), fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.whatsapp,
                color: Colors.white,
                size: 28,
              ),
              Icon(
                Icons.tiktok,
                color: Colors.white,
                size: 28,
              ),
              Icon(
                Icons.facebook,
                color: Colors.white,
                size: 28,
              ),
            ],
          ),
          const Divider(
            color: Color(0xFF5C63B1),
          ),
          const Text(
            "Copyright © 2008 - 2022, Amber Employ, All Rights Reserved",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF5C63B1), fontSize: 12),
          )
        ],
      ),
    );
  }
}
