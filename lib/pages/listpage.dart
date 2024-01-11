// listpage.dart

import 'package:flutter/material.dart';

import 'home.dart';

class ListPage extends StatelessWidget {
  final String title;
  final List<BoxData> boxList;

  const ListPage({Key? key, required this.title, required this.boxList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: boxList.length,
        itemBuilder: (context, index) {
          BoxData boxData = boxList[index];
          return ListTile(
            title: Text(boxData.fullName),
            // Add other details as needed
          );
        },
      ),
    );
  }
}
