import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/widgets/layout/spacers.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({required this.id, super.key});

  final String id;

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late final Map<String, dynamic> _job;

  @override
  void initState() {
    _job = {
      "title": "",
      "company": "",
      "description":
          "We are looking for an Account Manager to create long-term, trusting relationships with our customers. The Account Manager’s role is to oversee a portfolio of assigned customers, develop new business from existing clients and actively seek new sales opportunities.",
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacer(size: 36),
                Text(_job['title']),
                Text(_job['company']),
                const Text("Job Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                const Text("Job Brief", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(_job['description']),
                const Text("Responsibilities", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const Text("""
                Serve as the lead point of contact for all customer account management matters
                Build and maintain strong, long-lasting client relationships

                Negotiate contracts and close agreements to maximize profits

                Develop trusted advisor relationships with key accounts, customer stakeholders and executive sponsors

                Ensure the timely and successful delivery of our solutions according to customer needs and objectives.

                Forecast and track key account metrics (e.g. quarterly sales results and annual forecasts)

                Prepare reports on account status

                Collaborate with sales team to identify and grow opportunities within territory

                Assist with challenging client requests or issue escalations as needed
                """),
                const Text("Requirements and Skills", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const Text("""
                Proven work experience as an Account Manager, Key Account Manager, Sales Account Manager, Junior Account Manager or relevant role

                Demonstrable ability to communicate, present and influence key stakeholders at all levels of an organization, including executive and C-level

                Solid experience with CRM software (e.g. Salesforce, Zoho CRM or HubSpot) and MS Office (particularly MS Excel)

                Experience delivering client-focused solutions to customer needs

                Proven ability to juggle multiple account management projects at a time, while maintaining sharp attention to detail

                Excellent listening, negotiation and presentation abilities

                Strong verbal and written communication skills

                BA/BS degree in Business Administration, Sales or relevant field
                """),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Apply Now"),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 24,
            left: 24,
            child: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
