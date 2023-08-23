import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TwitterAuthButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final bool isBlack;
  final VoidCallback? onTap;

  const TwitterAuthButton({
    required this.text,
    this.isBlack = false,
    this.icon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(Sizes.size14),
          height: Sizes.size56,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
            borderRadius: BorderRadius.circular(Sizes.size32),
            color: isBlack ? Colors.black : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: icon,
              ),
              Gaps.h14,
              Text(
                text,
                style: TextStyle(
                  fontSize: Sizes.size18,
                  fontWeight: isBlack ? FontWeight.w900 : FontWeight.w800,
                  color: isBlack ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
