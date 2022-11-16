import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/models/post.model.dart';
import 'package:frontend_job_recruitment/screens/job_details.screen.dart';
import 'package:frontend_job_recruitment/services/http.service.dart';
import 'package:frontend_job_recruitment/tools/httpTools.dart';
import 'package:frontend_job_recruitment/widgets/layout/spacers.dart';

class JobListingsScreen extends StatelessWidget {
  const JobListingsScreen({super.key});

  final _jobs = const [
    {
      "id": "some_job",
      "title": "Account Manager",
      "company": "Massy Distribution (Trinidad)",
      "position": "Management, Manager",
      "location": "Macoya, Trinidad And Tobago",
      "date": "Oct. 10, 2022",
      "duration": "Permanent (Full-Time)",
    },
    {
      "id": "some_other_job",
      "title": "Senior Software Engineer",
      "company": "Massy Distribution (Trinidad)",
      "position": "Management, Manager",
      "location": "Macoya, Trinidad And Tobago",
      "date": "Oct. 10, 2022",
      "duration": "Permanent (Full-Time)",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              child: Image.asset(
                "assets/images/contact-hero.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Job Search", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    label: const Text("Search"),
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: FutureBuilder(
                  future: Post.getMany(PagedFiltered(limit: 6, page: 1)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 500,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (snapshot.hasError) {
                      return const SizedBox(
                        height: 500,
                        child: Center(child: Text("No jobs found!")),
                      );
                    }

                    final jobs = (snapshot.data!['data'] as List<dynamic>);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: jobs.length,
                      itemBuilder: (context, index) => buildJobListing(context, jobs[index]),
                    );
                  }),
            ),
            const CustomPaginator()
          ],
        ),
      ),
    );
  }

  Card buildJobListing(BuildContext context, Map<String, dynamic> job) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            Text(job['company'] ?? "N/A", style: const TextStyle(fontSize: 18)),
            const VerticalSpacer(size: 24),
            ListTile(
              leading: const Icon(Icons.work, color: Colors.black),
              title: Text(job['position']),
              contentPadding: const EdgeInsets.all(0),
              minLeadingWidth: 24,
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.black),
              title: Text(job['mailing_addres']),
              contentPadding: const EdgeInsets.all(0),
              minLeadingWidth: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.calendar_month, color: Colors.black),
                    title: Text(job['date'] ?? DateTime.now().toIso8601String()),
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                    minLeadingWidth: 24,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.access_time, color: Colors.black),
                    title: Text(job['duration'] ?? "N/A"),
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                    minLeadingWidth: 24,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => JobDetailsScreen(id: job['_id'])),
                    );
                  },
                  child: const Text("View Job"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPaginator extends StatefulWidget {
  const CustomPaginator({super.key});

  @override
  State<CustomPaginator> createState() => _CustomPaginatorState();
}

class _CustomPaginatorState extends State<CustomPaginator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextButton(onPressed: null, child: Text("Previous")),
          TextButton(onPressed: () {}, child: const Text("1")),
          TextButton(onPressed: () {}, child: const Text("2")),
          TextButton(onPressed: () {}, child: const Text("Next")),
        ],
      ),
    );
  }
}
