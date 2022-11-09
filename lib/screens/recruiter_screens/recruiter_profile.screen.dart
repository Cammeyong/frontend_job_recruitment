import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/screens/recruiter_screens/job_post.screen.dart';
import 'package:frontend_job_recruitment/widgets/layout/spacers.dart';

class RecruiterHome extends StatelessWidget {
  RecruiterHome({super.key});

  // TODO: Get company details
  final String _logo = '';
  final String _companyName = '';
  final String _description = '';
  final Map<String, String> _contactInfo = {
    'phone': '',
    'email': '',
    'address': '',
    'website': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recruiter Home')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                // TODO: Get image src
                // decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage(''))),
                ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              // child: CircleAvatar(backgroundImage: NetworkImage(_logo)),
            ),
            Text(_companyName, style: TextStyle(color: Theme.of(context).primaryColor)),
            const VerticalSpacer(size: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("About Us"),
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
                  const Text("Contact Info"),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _contactInfo.length,
                      (i) => Row(
                        children: [
                          Text(_contactInfo.keys.elementAt(i)),
                          const HorizontalSpacer(size: 4),
                          Text(_contactInfo.values.elementAt(i)),
                        ],
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
                // TODO: Navigate to job post screen
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
