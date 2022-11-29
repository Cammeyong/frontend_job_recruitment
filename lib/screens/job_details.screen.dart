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
                    const Text("Requirements and Skills", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(job!['requirements']),
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
