import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Card(
        color: Colors.white,  
        elevation: 10,  
        child: ListTile(  
          title: Text(  
            'Account Manager',  
            style: TextStyle(fontSize: 30.0)  
          ),  
          subtitle: Text(  
            'Amber Innovation, Kingston',  
            style: TextStyle(fontSize: 18.0)  
          ),  
        ),  
        
      ),
    );
  }
}
