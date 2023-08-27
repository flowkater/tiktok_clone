import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/authentication/verification_code_screen.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FinishScreen extends StatelessWidget {
  final String name;
  final String account;
  final String birthday;
  final bool isAgree;

  const FinishScreen({
    required this.name,
    required this.account,
    required this.birthday,
    required this.isAgree,
    super.key,
  });

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v14,
                  const Text(
                    "Create your account",
                    style: TextStyle(
                      fontSize: Sizes.size28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v32,
                  TextFormField(
                    readOnly: true,
                    initialValue: name,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.check_circle_sharp,
                          color: Colors.green, size: 40),
                      labelText: "Name",
                      labelStyle: const TextStyle(
                        height: 0.6,
                        color: Colors.black,
                        fontSize: Sizes.size20,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v16,
                  TextFormField(
                    initialValue: account,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.check_circle_sharp,
                          color: Colors.green, size: 40),
                      labelText: "Phone number or email address",
                      labelStyle: const TextStyle(
                        height: 0.6,
                        color: Colors.black,
                        fontSize: Sizes.size20,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v16,
                  TextFormField(
                    initialValue: birthday,
                    readOnly: true,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.check_circle_sharp,
                          color: Colors.green, size: 40),
                      labelText: "Date of birth",
                      labelStyle: const TextStyle(
                        height: 0.6,
                        color: Colors.black,
                        fontSize: Sizes.size20,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
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
                              ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. ",
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
                        const TextSpan(
                          text:
                              ". Others will be able to find you by email or phone number, when provided, unless you choose otherwise",
                        ),
                        TextSpan(
                          text: "here",
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
                  Gaps.v24,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const VerificationCodeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: Sizes.size52,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(Sizes.size24),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
