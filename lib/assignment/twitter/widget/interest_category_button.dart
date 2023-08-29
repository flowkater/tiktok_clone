import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestCategoryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const InterestCategoryButton({
    required this.title,
    required this.onTap,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
          vertical: Sizes.size12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size12,
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: Stack(
          children: [
            isSelected
                ? const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: Sizes.size16,
                    ),
                  )
                : const SizedBox.shrink(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
