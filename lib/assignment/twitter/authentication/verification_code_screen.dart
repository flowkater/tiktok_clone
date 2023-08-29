import 'package:flutter/material.dart';
import 'package:tiktok_clone/assignment/twitter/authentication/password_screen.dart';
import 'package:tiktok_clone/assignment/twitter/widget/layout.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

import '../widget/bottom_button.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  String code = "";
  bool isCodeCompleted = false;

  final List<TextEditingController> _codeControllers =
      List.generate(6, (_) => TextEditingController());
  final List<String> _codes = List.generate(6, (_) => "");
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void initState() {
    for (var i = 0; i < _codeControllers.length; i++) {
      _codeControllers[i].addListener(() {
        _codes[i] = _codeControllers[i].text;
        _updateCode();
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    for (var i = 0; i < _codeControllers.length; i++) {
      _codeControllers[i].dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _updateCode() {
    setState(() {
      code = _codes.join();
    });

    if (code.length == 6 && !isCodeCompleted) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isCodeCompleted = true;
        });
      });
    } else if (code.length != 6 && isCodeCompleted) {
      setState(() {
        isCodeCompleted = false;
      });
    }
  }

  bool _isLoading() {
    return code.length == 6 && !isCodeCompleted;
  }

  void onChanged(String value) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  void onFinishedChanged(String value) {
    if (value.length == 1) {
      FocusScope.of(context).unfocus();
    }
  }

  bool isCodeInputFinished() {
    return code.length == 6;
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
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v20,
              Text(
                "Enter it below to verify\nkater102@naver.com",
                style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: Sizes.size4),
                      child: oneCodeTextField(
                        _codeControllers[0],
                        _focusNodes[0],
                        context,
                        onChanged,
                        true,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: oneCodeTextField(
                        _codeControllers[1],
                        _focusNodes[1],
                        context,
                        onChanged,
                        false,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: oneCodeTextField(
                        _codeControllers[2],
                        _focusNodes[2],
                        context,
                        onChanged,
                        false,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: oneCodeTextField(
                        _codeControllers[3],
                        _focusNodes[3],
                        context,
                        onChanged,
                        false,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: oneCodeTextField(
                        _codeControllers[4],
                        _focusNodes[4],
                        context,
                        onChanged,
                        false,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: Sizes.size4),
                      child: oneCodeTextField(
                        _codeControllers[5],
                        _focusNodes[5],
                        context,
                        onFinishedChanged,
                        false,
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.v14,
              !_isLoading() && isCodeCompleted
                  ? const Center(
                      child: Icon(
                        Icons.check_circle_sharp,
                        color: Colors.green,
                        size: 40,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Didn't receive email?",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Gaps.v14,
              BottomButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PasswordScreen(),
                    ),
                  );
                },
                decoration: BoxDecoration(
                  color: isCodeInputFinished()
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(Sizes.size28),
                ),
                child: _isLoading()
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
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

  Widget oneCodeTextField(
    TextEditingController controller,
    FocusNode focusNode,
    BuildContext context,
    Function(String) onChanged,
    bool autoFocus,
  ) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      showCursor: false,
      autofocus: autoFocus,
      maxLength: 1,
      decoration: const InputDecoration(
        counter: Offstage(),
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: Sizes.size24,
        fontWeight: FontWeight.w800,
      ),
      onChanged: onChanged,
    );
  }
}
