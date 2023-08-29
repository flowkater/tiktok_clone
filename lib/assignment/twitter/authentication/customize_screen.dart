import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/twitter/authentication/finish_screen.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../../constants/sizes.dart';
import '../widget/bottom_button.dart';

class CustomizeScreen extends StatefulWidget {
  final String name;
  final String account;
  final String birthday;

  const CustomizeScreen({
    required this.name,
    required this.account,
    required this.birthday,
    super.key,
  });

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  bool _isToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size32,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: Sizes.size28,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 90,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Gaps.v32,
                  const Text(
                    "Customize your experience",
                    style: TextStyle(
                      fontSize: Sizes.size28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v32,
                  const Text(
                    "Track where you see Twitter content across the web",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v24,
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Row(
                      children: [
                        const Flexible(
                          flex: 3,
                          child: Text(
                            "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Sizes.size8),
                          child: CupertinoSwitch(
                              value: _isToggle,
                              onChanged: (bool value) {
                                setState(() {
                                  _isToggle = value;
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                  Gaps.v32,
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey.shade800,
                      ),
                      children: [
                        const TextSpan(
                          text: "By sigining up, you agree to our ",
                        ),
                        TextSpan(
                          text: "Terms",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Terms of Service");
                            },
                        ),
                        const TextSpan(
                          text: ", ",
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Terms of Service");
                            },
                        ),
                        const TextSpan(
                          text: ", "
                              "and ",
                        ),
                        TextSpan(
                          text: "Cookie Use",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Terms of Service");
                            },
                        ),
                        const TextSpan(
                          text:
                              ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ",
                        ),
                        TextSpan(
                          text: "Learn more",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Terms of Service");
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BottomButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FinishScreen(
                      name: widget.name,
                      account: widget.account,
                      birthday: widget.birthday,
                      isAgree: _isToggle,
                    ),
                  ));
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
