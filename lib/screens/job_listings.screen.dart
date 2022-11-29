import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/models/post.model.dart';
import 'package:frontend_job_recruitment/screens/job_details.screen.dart';
import 'package:frontend_job_recruitment/tools/httpTools.dart';
import 'package:frontend_job_recruitment/widgets/job_listing_paginator.dart';
import 'package:frontend_job_recruitment/widgets/layout/spacers.dart';

class JobListingsScreen extends StatefulWidget {
  const JobListingsScreen({super.key});

  @override
  State<JobListingsScreen> createState() => _JobListingsScreenState();
}

class _JobListingsScreenState extends State<JobListingsScreen> {
  Future<Map<String, dynamic>> _fetchPosts() async {
    return await Post.getMany(PagedFiltered(limit: 6, page: 1));
  }

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
              child: FutureBuilder<Map<String, dynamic>>(
                  future: _fetchPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 500,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (snapshot.hasError) {
                      print(snapshot.error);

                      return SizedBox(
                        height: 470,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("No jobs found!"),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text("Refresh"),
                              )
                            ],
                          ),
                        ),
                      );
                    }

                    final jobs = snapshot.data!['data'] as List<Map<String, dynamic>>;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: jobs.length,
                      itemBuilder: (context, index) => buildJobListing(context, jobs[index]),
                    );
                  }),
            ),
            const CustomPaginator(),
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
