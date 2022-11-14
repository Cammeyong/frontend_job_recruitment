import 'package:flutter/material.dart';

import '../widgets/appBar_gradient.dart';
import '../widgets/app_drawer.dart';
import '../widgets/jobCard.dart';

class JobListing extends StatelessWidget {
 JobListing({super.key});


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AmberAppBarGradient(
        scaffoldKey: _scaffoldKey,
      ),
      endDrawer: const AppDrawer(),
      body: Column(
        children: [
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.greenAccent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'images/meeting-1.jpg',
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const JobCard();
            },
          ),
        ],
      )
    
    );
  }
 
}
