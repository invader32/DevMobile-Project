import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: true, // You can bind this to your notification state
                onChanged: (value) {
                  // Implement logic for handling notifications
                },
              ),
            ),
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: false, // You can bind this to your dark mode state
                onChanged: (value) {
                  // Implement logic for handling dark mode
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Implement logic for changing password
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Implement logic for logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
