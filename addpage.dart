import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'settings.dart';

class addpage extends StatefulWidget {
  const addpage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<addpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromRGBO(212, 212, 212, 1.0);

    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                )
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: myColor,
                  hintText: "                     Add a Person",
                  contentPadding: EdgeInsets.all(9),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                        'assets/icons/add-circle-svgrepo-com (1).svg'),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none)),
            ),
          ),
          SizedBox(height: 80),
          buildInputField("Full Name"),
          buildInputField("Age"),
          buildInputField("Address"),
        ],
      ),
    );
  }

  Widget buildInputField(String labelText, [String? iconPath]) {
    Color myColor = const Color.fromRGBO(212, 212, 212, 1.0);

    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              labelText,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: myColor,
                    contentPadding: EdgeInsets.all(9),
                    prefixIcon: iconPath != null
                        ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(iconPath),
                    )
                        : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    Color myColor = const Color.fromRGBO(1, 64, 92, 1.0);
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        backgroundColor: myColor,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            // Handle the lines button tap
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff01405C),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/lines-svgrepo-com.svg',
              height: 28,
              width: 28,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Handle the settings button tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff01405C),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              child: SvgPicture.asset(
                'assets/icons/settings-svgrepo-com.svg',
                height: 28,
                width: 28,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
    );
  }
}
