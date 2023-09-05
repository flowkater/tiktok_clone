import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        title: const Text('Privacy'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(),
            SwitchListTile(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
              secondary: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(
                  Icons.lock_outline,
                  color: Colors.black,
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Text('Private profile'),
              ),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.at,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Mentions'),
              onTap: () {
                print("Mentions");
              },
              trailing: const SizedBox(
                width: 85,
                child: Row(
                  children: [
                    Text(
                      'Everyone',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.bellSlash,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Muted'),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: () {
                print("Muted");
              },
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.eyeSlash,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Hidden Words'),
              onTap: () {
                print("Hidden Words");
              },
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.peopleGroup,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Profiles you follow'),
              onTap: () {
                print("Profiles you follow");
              },
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: const Text('Other privacy settings'),
              subtitle: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Text(
                  'Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              onTap: () {
                print("Blocked profiles");
              },
              trailing: const Icon(
                Icons.open_in_new,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.circleXmark,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Blocked profiles'),
              onTap: () {
                print("Blocked profiles");
              },
              trailing: const Icon(
                Icons.open_in_new,
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.heart,
                color: Colors.black,
              ),
              horizontalTitleGap: 0,
              title: const Text('Hide likes'),
              onTap: () {
                print("Hide likes");
              },
              trailing: const Icon(
                Icons.open_in_new,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
