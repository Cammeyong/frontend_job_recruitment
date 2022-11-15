import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:frontend_job_recruitment/widgets/layout/spacers.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  final List<Map<String, String>> _employerQuestions = const [
    {
      'title': "How do I post a job on Amber Employ?",
      'body':
          "Here are the steps to manually post a job in your Recruit Caribbean account. \n 1. Under Publish Jobs in your account, click Post New Job. \n 2. Complete the required fields, including Job Title, Job Description, and Job Location. \n 3. Click Proceed to Next Step. \n 4. Complete any of the remaining optional fields to add more details to your job posting. remaining fields. (Note: The more information you include, the more likely candidates are to apply!) \n 5. Click Save and Publish.",
    },
    {
      'title': "How do I edit my profile?",
      'body': "Coming Soon",
    },
    {
      'title': "How do I search for an applicant?",
      'body': "Coming Soon",
    },
    {
      'title': "How do I unregister my account?",
      'body': "Coming Soon",
    },
  ];

  final List<Map<String, String>> _applicantQuestions = const [
    {
      'title': "How do I search for jobs on Amber Employ?",
      'body': "Coming Soon",
    },
    {
      'title': "How do I apply for a job posted on Amber Employ?",
      'body': "Coming Soon",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/faq-image.jpg", fit: BoxFit.cover, width: double.infinity),
              const Positioned(
                top: 72,
                left: 8,
                child: Text(
                  "Frequently Asked Questions",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const VerticalSpacer(size: 18),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("For Employers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: _employerQuestions.map((q) => _buildQuestionPanel(q)).toList(),
                    ),
                    const VerticalSpacer(size: 16),
                    const Text("For Applicants", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: _applicantQuestions.map((q) => _buildQuestionPanel(q)).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Cannot find what you are looking for?"),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(foregroundColor: Theme.of(context).primaryColor),
                          child: const Text('Email Us'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildQuestionPanel(Map<String, String> q) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all()),
      child: ExpandablePanel(
        header: Text(
          q['title']!,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        theme: const ExpandableThemeData(
          expandIcon: Icons.add,
          headerAlignment: ExpandablePanelHeaderAlignment.center,
        ),
        collapsed: const SizedBox(),
        expanded: Text(q['body']!),
      ),
    );
  }
}
