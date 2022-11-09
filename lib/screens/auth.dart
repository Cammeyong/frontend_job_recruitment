import 'package:flutter/material.dart';
import 'package:frontend_job_recruitment/pages/appli_reg.page.dart';
// import 'package:flutter/widgets.dart';
import '../widgets/app_drawer.dart';
import '../widgets/appBar.dart';
// import 'appli_reg.dart';
import 'form_page.dart';

// import 'package:frontend_job_recruitment/screens/form_page.dart';
// import 'package:frontend_job_recruitment/screens/appli_reg.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showFormPage = true;
  void toggleView() {
    setState(() => showFormPage = !showFormPage);
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey(); // create a global key for scaffoldstate

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: AmberAppBar(
          scaffoldKey: _scaffoldKey,
        ),
        endDrawer: const AppDrawer(),
        body: Column(children: [
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
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 35.0, bottom: 15),
                // height: 10,
                child: Text(
                  showFormPage
                      ? 'Company Registration'
                      : 'Applicant Registration',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 92, 99, 177),
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 92, 99, 177),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                height: 40,
                width: 200,
                // margin: const EdgeInsets.all(15),
                // padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: toggleView,
                      style: TextButton.styleFrom(
                        backgroundColor:
                        const Color.fromARGB(255, 255, 255, 255),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(10.0)
                        // ),
                      ),  
                      child: const Text('Recruiter',
                        style: TextStyle(color: Color.fromARGB(255,92,99,177)),
                      ),
                    ),
                    TextButton(
                      onPressed: toggleView,
                      style: TextButton.styleFrom(
                        backgroundColor:
                        const Color.fromARGB(255, 92, 99, 177),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      ),  
                      child: const Text('Recruitee',style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          showFormPage
              ? Expanded(child: FormPage(toggleView: toggleView))
              : Expanded(child: AppliRegForm(toggleView: toggleView))
        ]));
  }
}
