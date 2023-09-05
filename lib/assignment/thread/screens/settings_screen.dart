import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/thread/screens/privacy_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.userPlus,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Follow and invite friends'),
              onTap: () {
                print("Follow and invite friends");
              },
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.bell,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Notifications'),
              onTap: () {
                print("Notifications");
              },
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.lock,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Privacy'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PrivacyScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.circleUser,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Account'),
              onTap: () {
                print("Account");
              },
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.hospital,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Help'),
              onTap: () {
                print("Help");
              },
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.circleInfo,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('About'),
              onTap: () {
                print("About");
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Log out',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Log out'),
                        content:
                            const Text('Are you sure you want to log out?'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoDialogAction(
                            child: const Text('Log out'),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
