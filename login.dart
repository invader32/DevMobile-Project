import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:firedart/firedart.dart';
import 'dart:math';

import 'login_information.dart';
import 'SignIn.dart';






String generateRandomPassword() {
  final Random random = Random();
  const String chars = "abcdefghijklmnopqrstuvwxyz0123456789!@#%^&*()-_=+";

  // Generate a random password of length 8
  String password = List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();

  return password;
}
const apiKey = 'AIzaSyDzFAk0dAYLawCcpgj-NCy05ryWreFGS_8';
const projectId='ilyas-ngou-dev';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromRGBO(1, 64, 92, 1.0);
    return Home(myColor: myColor,);
  }
}










class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.myColor,
  });

  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        centerTitle: true,
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
            children: [
              Container(
                width: 100 * 0.7,
                height: 100 * 0.7,
                child: Image.asset("assets/images/op.png"),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  SvgPicture.asset(
                    "assets/images/login.svg",
                    height: 35,
                    width: 35,
                  ),
                ],
              ),
              SizedBox(height: 20),
              MyTextFieldContainer(
                title: 'Username',
                hintText: 'Enter your username',
                icon: Icons.person,
              ),
              SizedBox(height: 20),
              MyTextFieldContainer(
                title: 'Password',
                hintText: 'Enter your password',
                icon: Icons.lock,
                suffixIcon: Icons.visibility_off,
                obscureText: true,
                onPressed: () {
                  // Handle visibility toggle logic
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_,__,___) => SignIn(myColor: myColor)
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: myColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(150, 40),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  text: "Don’t have an account? ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "  Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: myColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => SignIn(myColor: myColor),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: myColor,
        height: 55,
        child: Container(

          color: myColor,
        ),
      ),
    );
  }
}

class MyTextFieldContainer extends StatefulWidget {
  final String title;
  final String hintText;
  final IconData icon;
  final IconData? suffixIcon;
  final bool obscureText;
  final VoidCallback? onPressed;

  const MyTextFieldContainer({
    Key? key,
    required this.title,
    required this.hintText,
    required this.icon,
    this.suffixIcon,
    this.obscureText = false,
    this.onPressed,
  }) : super(key: key);

  @override
  _MyTextFieldContainerState createState() => _MyTextFieldContainerState();
}

class _MyTextFieldContainerState extends State<MyTextFieldContainer> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromRGBO(1, 64, 92, 1.0);
    Color containerColor = Colors.grey[300] ?? Colors.grey;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color:  Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 275,
          height: 45,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                obscureText: widget.obscureText ? _obscureText : false,
                decoration: InputDecoration(
                  icon: Icon(widget.icon, color: Colors.black),
                  suffixIcon: widget.suffixIcon != null
                      ? IconButton(
                    icon: Icon(widget.suffixIcon, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                      if (widget.onPressed != null) {
                        widget.onPressed!();
                      }
                    },
                  )
                      : null,
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void main() {

  runApp(MaterialApp(
    home: HomePage(),
  ));
}