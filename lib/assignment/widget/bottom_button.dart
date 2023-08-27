import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class BottomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final BoxDecoration? decoration;

  const BottomButton({
    required this.child,
    required this.onTap,
    this.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: Sizes.size56,
        decoration: decoration ??
            BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size24),
            ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
