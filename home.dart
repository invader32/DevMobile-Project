import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'camera.dart';
import 'profile.dart';
import 'settings.dart';
import 'addpage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromRGBO(1, 64, 92, 1.0);
    Color boxColor = const Color(0xffD4D4D4);
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: Container(
        height: 67,
        child: BottomNavigationBar(
          backgroundColor: myColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home-1-svgrepo-com.svg',
                height: 32,
                width: 32,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/camera-svgrepo-com.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile-circle-svgrepo-com.svg',
                width: 32,
                height: 32,
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: boxColor,
                    height: double.infinity,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/search-alt-2-svgrepo-com.svg'),
                          SizedBox(width: 8.0),
                          Text(
                            'Searched',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 2.0,
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                    color: boxColor,
                    height: double.infinity,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/missing-svgrepo-com.svg', height: 21, width: 21),
                          SizedBox(width: 8.0),
                          Text(
                            'Missing',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 25, right: 25),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Color(0xff1D1617).withOpacity(0.11), blurRadius: 40, spreadRadius: 0.0)]),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: boxColor,
                  contentPadding: EdgeInsets.all(6),
                  hintText: 'Search a Person',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'assets/icons/search-alt-2-svgrepo-com.svg',
                      width: 10,
                      height: 10,
                    ),
                  ),
                  suffixIcon: Container(
                    width: 100,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          VerticalDivider(
                            color: Colors.black,
                            indent: 10,
                            endIndent: 10,
                            thickness: 0.1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: SvgPicture.asset(
                              'assets/icons/filter-ascending-svgrepo-com.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 25, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => addpage()),
                    );
                    setState(() {
                      BoxSlider.itemCount += 1;
                    });


                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffD4D4D4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/add-circle-svgrepo-com (1).svg',
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BoxSlider(),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CameraApp()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
          break;
      }
    });
  }

  AppBar appBar() {
    Color myColor = const Color.fromRGBO(1, 64, 92, 1.0);
    return AppBar(
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
    );
  }
}

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
      ),
      body: Center(
        child: Text('This is the Camera Page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Text('This is the Profile Page'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        child: Text('This is the Settings Page'),
      ),
    );
  }
}

class BoxSlider extends StatefulWidget {
  static int itemCount = 10;

  @override
  _BoxSliderState createState() => _BoxSliderState();
}

class _BoxSliderState extends State<BoxSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: BoxSlider.itemCount,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffD4D4D4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      'https://via.placeholder.com/50',
                      height: 100,
                      width: 80,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xffD4D4D4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Line 1',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          'Line 2',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          'Line 3',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
                          'Line 4',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Container(
                  width: 29,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xffD4D4D4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/pencil-svgrepo-com.svg',
                        height: 22,
                        width: 22,
                        color: Colors.black,
                      ),
                      SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/icons/delete-svgrepo-com.svg',
                        height: 27,
                        width: 25,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
