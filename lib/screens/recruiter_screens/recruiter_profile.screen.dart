import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/tools/string_extension.dart';
import 'package:frontend_job_recruitment/screens/recruiter_screens/job_post.screen.dart';
import 'package:frontend_job_recruitment/widgets/layout/spacers.dart';

class RecruiterHome extends StatelessWidget {
  RecruiterHome({super.key});

  // TODO: Get company details
  final String _logo = '';
  final String _companyName = 'Company Name';
  final String _description =
      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.';
  final Map<String, String> _contactInfo = {
    'phone': '',
    'email': '',
    'address': '',
    'website': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/recruiter-image.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                // backgroundImage: NetworkImage(_logo),
                radius: 50,
                child: Text("Logo"),
              ),
            ),
            const VerticalSpacer(size: 12),
            Text(
              _companyName.toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const VerticalSpacer(size: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ABOUT US",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const VerticalSpacer(size: 8),
                  Text(_description),
                ],
              ),
            ),
            const VerticalSpacer(size: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CONTACT INFO",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Color(0xFFB749A3),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const VerticalSpacer(size: 24),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _contactInfo.length,
                      (i) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Text(
                              '${_contactInfo.keys.elementAt(i).capitalize()}:',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const HorizontalSpacer(size: 4),
                            Text(
                              _contactInfo.values.elementAt(i),
                              style: TextStyle(color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacer(size: 28),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB749A3),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const JobPostScreen(),
                  fullscreenDialog: true,
                ));
              },
              child: const Text('Post a Job'),
            )
          ],
        ),
      ),
    );
  }
}
