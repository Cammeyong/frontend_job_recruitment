import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Heading
        const Text(
          'MEMBER LOGIN',
          style: TextStyle(
            // hex color #5C63B1
            // 0xff is the prefix of every hex color
            color: Color(0xff5C63B1),
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 50),

        // Email textfield
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email or Username',
                hintStyle: TextStyle(color: Color(0xff5C63B1)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),

        // Password textfield
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black45),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: TextStyle(color: Color(0xff5C63B1)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),

        // Remember me / Forgot password

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Remember me?  ',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '  Forgot password',
              style: TextStyle(
                color: Color(0xff2645EA),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),

        // login button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xffB749A2),
                borderRadius: BorderRadius.circular(12)),
            child: const Center(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  letterSpacing: 3,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),

        // Not a member? register here
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Not a member?  ',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '  Register Now',
              style: TextStyle(
                color: Color(0xff2645EA),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ]),
    )));
  }
}
