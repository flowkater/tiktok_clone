import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/authentication/create_account_screen.dart';
import 'package:tiktok_clone/assignment/widget/twitter_auth_button.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAcctounScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gaps.v32,
              const Text(
                "See What's happening in the world right now.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Column(
                children: [
                  TwitterAuthButton(
                    icon: Image.asset("images/g-logo.png"),
                    text: "Continue with Google",
                  ),
                  Gaps.v14,
                  const TwitterAuthButton(
                    icon: FaIcon(
                      FontAwesomeIcons.apple,
                      size: Sizes.size28,
                    ),
                    text: "Continue with Apple",
                  ),
                  Gaps.v14,
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1.0,
                        ),
                      ),
                      Gaps.h10,
                      Text(
                        "or",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: Sizes.size12,
                        ),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade300,
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v4,
                  TwitterAuthButton(
                    text: "Create account",
                    isBlack: true,
                    onTap: () => _onCreateAccountTap(context),
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
                          text: ".",
                        ),
                      ],
                    ),
                  ),
                  Gaps.v32,
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size32,
            horizontal: Sizes.size40,
          ),
          child: Row(
            children: [
              Text(
                "Have an account already?",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.grey.shade800,
                ),
              ),
              Gaps.h5,
              GestureDetector(
                // onTap: () => _onLoginTap(context),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
