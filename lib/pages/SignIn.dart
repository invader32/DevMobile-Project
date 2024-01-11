
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;

import 'dart:math';

import 'login_information.dart';


class SignIn extends StatelessWidget {
  final Color myColor;

  SignIn({required this.myColor});

  @override
  Widget build(BuildContext context) {
    const IconData login = IconData(0xe3b2, fontFamily: 'MaterialIcons');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  "Create Account",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(width: 15),
                SvgPicture.asset(
                  "assets/images/login.svg",
                  height: 35,
                  width: 35,
                ),

              ],
            ),
            SizedBox(height: 15),
            MyTextFieldContainer(
              title: 'Fullname',
              hintText: 'Enter your fullname',
              icon: Icons.person,
            ),
            SizedBox(height: 15),
            MyTextFieldContainer(
              title: 'CIN',
              hintText: 'Enter your CIN',
              icon: Icons.credit_card,
            ),
            SizedBox(height: 15),
            MyTextFieldContainer(
              title: 'Badge Number',
              hintText: 'Enter your badge number',
              icon: Icons.badge,
            ),
            SizedBox(height: 35),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        Password(myColor: myColor)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: myColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minimumSize: Size(180, 40),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[300],
                  ),
                ),

              ),
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: myColor,
        height: 55,
        child: Container(
          color: myColor,
        ),
      ),);
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