import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class Layout extends StatelessWidget {
  final Widget child;
  Widget? bottomNavigationBar;
  bool isTopPadding;

  Layout({
    required this.child,
    this.bottomNavigationBar,
    this.isTopPadding = true,
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
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isTopPadding ? Sizes.size40 : 0,
          ),
          child: child,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
