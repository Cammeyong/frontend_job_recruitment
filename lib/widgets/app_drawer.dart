import 'package:flutter/material.dart';

// import '../widgets/appBar.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override

// ignore: non_constant_identifier_names
  Widget build(BuildContext Context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actionsPadding: EdgeInsets.zero,
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        "Amber Employ",
        style: Theme.of(context).textTheme.headline5,
      ),
// A line between the title section and the list of links
      content: const Divider(
        thickness: 1.0,
        color: Colors.black,
      ),
      actions: [
        // Past two links as list tiles
        ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              // Home button action
            }),
        ListTile(
          leading:const Icon(Icons.accessibility),
          title: const Text("About Us"),
          onTap: () {
            // Home button action
          }
        ),

        ListTile(
          leading: const Icon(Icons.search),
          title: const Text("Job Listing"),
          onTap: () {
            // Find job button action
          }
        ),

        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text("Contact Us"),
          onTap: () {
      
          }
        ),

        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Login"),
          onTap: () {
            // My Pfofile button action
          }
        ),

        // ListTile(
        //     leading: Icon(
        //       Icons.logout,
        //       color: Theme.of(context).colorScheme.secondary,
        //     ),
        //     title: const Text('Logout'),
        //     onTap: () {
        //       alert("You are Logged Out");
        //     }),
        
      ],
    );
//   Drawer(
//     // appBar: const AmberAppBar(),
//     child: SingleChildScrollView(
//         child: Container(
//             margin: const EdgeInsets.only(top: 50),
//             child: Column(
//               children: <Widget>[
//                 ListTile(
//                     leading: const Icon(Icons.home),
//                     title: const Text("Home"),
//                     onTap: () {
//                       // Home button action
//                     }),
//                 ListTile(
//                     // leading:const Icon(),
//                     title: const Text("About Us"),
//                     onTap: () {
//                       // Home button action
//                     }),

//                 ListTile(
//                     leading: const Icon(Icons.search),
//                     title: const Text("Job Listing"),
//                     onTap: () {
//                       // Find peoples button action
//                     }),

//                 ListTile(
//                     leading: const Icon(Icons.phone),
//                     title: const Text("Contact Us"),
//                     onTap: () {
//                       // Find peoples button action
//                     }),

//                 ListTile(
//                     leading: const Icon(Icons.person),
//                     title: const Text("Login"),
//                     onTap: () {
//                       // My Pfofile button action
//                     }),

//                 //add more drawer menu here
//               ],
//             ))),
//   );
  }
}
