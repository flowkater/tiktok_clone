import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/twitter/authentication/interest_screen.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';
import '../widget/bottom_button.dart';
import '../widget/layout.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String password = "";
  bool _obscureText = true;

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _passwordController.addListener(() {
      setState(() {
        password = _passwordController.text;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  String? isValidate(String? value, Function? valid) {
    if (value == null || value.isEmpty) {
      return "Please enter your $value";
    }
    if (valid == null) {
      return null;
    }
    return valid(value);
  }

  String? _isPasswordValid(String? value) {
    if (value == null) return null;

    if (value.isEmpty) return null;
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  bool isPasswordInputFinished() {
    return isValidate(password, _isPasswordValid) == null;
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v14,
              const Text(
                "You'll need a password",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              Text(
                "Make sure it's 8 characters or more.",
                style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700),
              ),
              Gaps.v20,
              TextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                obscureText: _obscureText,
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade500,
                          size: Sizes.size28,
                        ),
                      ),
                      Gaps.h4,
                      isValidate(password, _isPasswordValid) == null
                          ? const Center(
                              child: Icon(
                                Icons.check_circle_sharp,
                                color: Colors.green,
                                size: Sizes.size28,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  labelText: "Password",
                  errorText: _isPasswordValid(password),
                  labelStyle: TextStyle(
                    height: 0.6,
                    color: _passwordFocusNode.hasFocus
                        ? Colors.black
                        : Colors.grey.shade800,
                    fontSize: _passwordFocusNode.hasFocus
                        ? Sizes.size20
                        : Sizes.size16,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottomButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InterestScreen(),
                    ),
                  );
                },
                decoration: BoxDecoration(
                  color: isPasswordInputFinished()
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(Sizes.size28),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gaps.v14,
            ],
          )
        ],
      ),
    );
  }
}
