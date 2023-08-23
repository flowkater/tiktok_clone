import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/authentication/customize_screen.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class CreateAcctounScreen extends StatefulWidget {
  const CreateAcctounScreen({super.key});

  @override
  State<CreateAcctounScreen> createState() => _CreateAcctounScreenState();
}

enum AccountType { email, phone, none }

class _CreateAcctounScreenState extends State<CreateAcctounScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> _formControllers = {
    "name": TextEditingController(),
    "account": TextEditingController(),
    "birthday": TextEditingController(),
  };

  final Map<String, FocusNode> _formFocusNodes = {
    "name": FocusNode(),
    "account": FocusNode(),
    "birthday": FocusNode(),
  };

  Map<String, String> formData = {};
  final DateTime _selectedDate = DateTime.now();

  bool isBirthdayTap = false;

  AccountType _fieldAccountType = AccountType.none;

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _formControllers["birthday"]!.value = TextEditingValue(text: textDate);
  }

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }
    }
  }

  @override
  void initState() {
    for (var key in _formControllers.keys) {
      _formControllers[key]!.addListener(() {
        setState(() {
          formData[key] = _formControllers[key]!.text;
        });
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _formFocusNodes.forEach((key, value) {
      value.dispose();
    });

    _formControllers.forEach((key, value) {
      value.dispose();
    });

    super.dispose();
  }

  void _requestFocus(String focusNodeName) {
    setState(() {
      FocusScope.of(context).requestFocus(_formFocusNodes[focusNodeName]!);
      if (focusNodeName == "birthday") {
        isBirthdayTap = true;
      } else {
        isBirthdayTap = false;
      }
    });
  }

  String? isValidate(String? value, Function? valid) {
    if (value == null || value.isEmpty) {
      return "Please enter your Name";
    }
    if (valid == null) {
      return null;
    }
    return valid(value);
  }

  String? _isNameValid(String? value) {
    if (value == null) return null;

    if (value.isEmpty) return null;
    if (value.length < 3) {
      return "Name must be at least 3 characters long";
    }
    return null;
  }

  String? isAccountValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your account";
    }
    return _isAccountValid(value);
  }

  String? _isAccountValid(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return null;

    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (regExp.hasMatch(value)) {
      _fieldAccountType = AccountType.email;
      return null;
    }

    final phonePattern = RegExp(r'^\d{10,}$');
    if (phonePattern.hasMatch(value)) {
      _fieldAccountType = AccountType.phone;
      return null;
    }

    return "Invalid Input for email or phone number";
  }

  bool isFormValid() {
    return !["name", "account", "birthday"]
        .any((key) => formData[key] == null || formData[key]!.isEmpty);
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
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: Sizes.size18,
                    // fontWeight: FontWeight.w600,
                  ),
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
          child: Form(
            key: _formKey,
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
                      controller: _formControllers["name"],
                      focusNode: _formFocusNodes["name"],
                      onTap: () => _requestFocus("name"),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: InputDecoration(
                        suffixIcon:
                            isValidate(formData['name'], _isNameValid) == null
                                ? const Icon(Icons.check_circle_sharp,
                                    color: Colors.green, size: 40)
                                : null,
                        labelText: "Name",
                        errorText: _isNameValid(formData['name']),
                        labelStyle: TextStyle(
                          height: 0.6,
                          color: _formFocusNodes["name"]!.hasFocus
                              ? Colors.black
                              : Colors.grey.shade800,
                          fontSize: _formFocusNodes["name"]!.hasFocus
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
                      validator: (value) => isValidate(value, _isNameValid),
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["name"] = newValue;
                        }
                      },
                    ),
                    Gaps.v16,
                    TextFormField(
                      controller: _formControllers["account"],
                      focusNode: _formFocusNodes["account"],
                      onTap: () => _requestFocus("account"),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: InputDecoration(
                        suffixIcon:
                            isValidate(formData['account'], _isAccountValid) ==
                                    null
                                ? const Icon(Icons.check_circle_sharp,
                                    color: Colors.green, size: 40)
                                : null,
                        labelText: "Phone number or email address",
                        errorText: _isAccountValid(formData['account']),
                        labelStyle: TextStyle(
                          height: 0.6,
                          color: _formFocusNodes["account"]!.hasFocus
                              ? Colors.black
                              : Colors.grey.shade800,
                          fontSize: _formFocusNodes["account"]!.hasFocus
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
                      validator: (value) => isValidate(value, _isAccountValid),
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["account"] = newValue;
                        }
                      },
                    ),
                    Gaps.v16,
                    TextFormField(
                      controller: _formControllers["birthday"],
                      readOnly: true,
                      focusNode: _formFocusNodes["birthday"],
                      onTap: () => _requestFocus("birthday"),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: InputDecoration(
                        suffixIcon:
                            isValidate(formData['birthday'], null) == null
                                ? const Icon(Icons.check_circle_sharp,
                                    color: Colors.green, size: 40)
                                : null,
                        labelText: "Date of birth",
                        labelStyle: TextStyle(
                          height: 0.6,
                          color: _formFocusNodes["birthday"]!.hasFocus
                              ? Colors.black
                              : Colors.grey.shade800,
                          fontSize: _formFocusNodes["birthday"]!.hasFocus
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
                      validator: (value) => isValidate(value, null),
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["birthday"] = newValue;
                        }
                      },
                    ),
                    Gaps.v12,
                    isBirthdayTap
                        ? Text(
                            "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: Sizes.size16,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Sizes.size16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _fieldAccountType == AccountType.email
                            ? "Use phone instead"
                            : _fieldAccountType == AccountType.phone
                                ? "Use email instead"
                                : "",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: Sizes.size20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (isFormValid()) {
                            _onSubmitTap();

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CustomizeScreen(
                                name: formData["name"]!,
                                account: formData["account"]!,
                                birthday: formData["birthday"]!,
                              ),
                            ));
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size16,
                            vertical: Sizes.size8,
                          ),
                          decoration: BoxDecoration(
                            color: isFormValid()
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(Sizes.size20),
                          ),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: isBirthdayTap
          ? BottomAppBar(
              child: SizedBox(
                height: 300,
                child: CupertinoDatePicker(
                  maximumDate: _selectedDate,
                  initialDateTime: _selectedDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: _setTextFieldDate,
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
