import 'package:flutter/material.dart';
import 'dart:math';

import 'SignIn.dart';
import 'home.dart';

class Password extends StatefulWidget {
  final Color myColor;

  Password({required this.myColor});

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _obscureText = true;

  String generateRandomPassword() {
    final Random random = Random();
    const String chars = "abcdefghijklmnopqrstuvwxyz0123456789!@#%^&*()-_=+";
    return List.generate(8, (index) => chars[random.nextInt(chars.length)]).join();
  }

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
            SizedBox(height: 60),
            Text(
              "Your Informations *",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 100 * 0.8,
              height: 100 * 0.8,
              child: Image.asset("assets/images/op.png"),
            ),
            SizedBox(height: 50),
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
            SizedBox(height: 35),
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
                            SizedBox(width: 14),
                            Container(
                              // Conteneur pour les cercles et le texte généré
                              child: Row(
                                children: [
                                  if (_obscureText) // Afficher les cercles à l'état initial
                                    Row(
                                      children: List.generate(
                                        8,
                                            (index) => Container(
                                          width: 7,
                                          height: 7,
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
                                        fontSize: 19,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.15),

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
            SizedBox(height: 65),
            ElevatedButton(
              onPressed: () {

                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_,__,___) => HomePage()
                    )
                );
              },
              style: ElevatedButton.styleFrom(
                primary: widget.myColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                minimumSize: Size(150, 40),
              ),
              child: Text(
                'Validate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
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
