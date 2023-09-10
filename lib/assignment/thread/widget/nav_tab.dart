import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/thread/utils/utils.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
  });

  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isSelected ? 1 : 0.6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                isSelected ? selectedIcon : icon,
                color: isDark ? Colors.white : Colors.grey.shade900,
                size: Sizes.size28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
