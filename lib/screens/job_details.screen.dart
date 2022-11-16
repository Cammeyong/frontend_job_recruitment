import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/models/post.model.dart';
import 'package:frontend_job_recruitment/widgets/layout/spacers.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({required this.id, super.key});

  final String id;

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 36,
            left: 18,
            child: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          FutureBuilder<dynamic>(
            future: Post.get(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError || !snapshot.hasData) {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("No data found"),
                    ],
                  ),
                );
              }

              final job = snapshot.data!['data'];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpacer(size: 36),
                    Text(job!['title']),
                    Text(job!['company']),
                    const Text("Job Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                    const Text("Job Brief", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(job!['description']),
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
              );
            },
          ),
        ],
      ),
    );
  }
}
