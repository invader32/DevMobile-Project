  import 'package:flutter/material.dart';
import 'package:project/pages/camera.dart';
  import 'package:project/pages/home.dart';
import 'package:project/pages/profile.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return  MaterialApp(
        debugShowCheckedModeBanner: false ,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const HomePage(),

      );
    }
  }

