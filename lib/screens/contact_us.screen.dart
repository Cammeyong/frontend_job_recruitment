import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/widgets/layout/footer.dart';
import 'package:frontend_job_recruitment/widgets/layout/spacers.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const Footer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/contact-hero.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 90,
                    top: 100,
                    child: Row(
                      children: const [
                        Text(
                          "CONTACT",
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 36.0),
              child: Text(
                "Let's Start A Conversation",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 84.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined),
                      const HorizontalSpacer(size: 4),
                      const Text(
                        "Phone:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const HorizontalSpacer(size: 4),
                      Text(
                        "(876)123-4567",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                  const VerticalSpacer(size: 8),
                  Row(
                    children: [
                      const Icon(Icons.email_outlined),
                      const HorizontalSpacer(size: 4),
                      const Text(
                        "Email:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const HorizontalSpacer(size: 4),
                      Text(
                        "support@example.com",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                  const VerticalSpacer(size: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      const HorizontalSpacer(size: 4),
                      const Text(
                        "Address:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const HorizontalSpacer(size: 4),
                      Text(
                        "15 Long Last Crescent,\n Kingston 72, Jamaica",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
