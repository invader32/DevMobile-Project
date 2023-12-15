import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:firedart/firedart.dart';
import 'dart:math';

String generateRandomPassword() {
  final Random random = Random();
  const String chars = "abcdefghijklmnopqrstuvwxyz0123456789!@#%^&*()-_=+";

  // Generate a random password of length 8
  String password = List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();

  return password;
}

class Password extends StatefulWidget {
  final Color myColor;

  Password({required this.myColor});

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.myColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 55),
            Text(
              "Your Informations *",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 100 * 0.8,
              height: 100 * 0.8,
              child: Image.asset("assets/images/op.png"),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "Your Pseudo :",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Row(
                          children: [
                            Text(
                              "Your Password:",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            if (_obscureText) // Afficher les cercles à l'état initial
                              Row(
                                children: List.generate(
                                  8,
                                      (index) => Container(
                                    width: 12,
                                    height: 12,
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            if (!_obscureText) // Afficher le mot de passe généré lorsque visible
                              Text(
                                generateRandomPassword(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            SizedBox(width: 35),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: widget.myColor,
        height: 55,
        child: Container(
          color: widget.myColor,
        ),
      ),
    );
  }
}
