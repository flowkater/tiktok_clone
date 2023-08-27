import 'package:flutter/material.dart';
import 'package:tiktok_clone/assignment/authentication/interest_detail_screen.dart';
import 'package:tiktok_clone/assignment/widget/interest_category_button.dart';
import 'package:tiktok_clone/assignment/widget/layout.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  Set<int> selectedItems = {};

  void _onTap(int index) {
    setState(() {
      if (selectedItems.contains(index)) {
        selectedItems.remove(index);
      } else {
        selectedItems.add(index);
      }
    });
  }

  bool _isCompleted() {
    return selectedItems.length >= 3;
  }

  String _selectedItemNumbers() {
    if (selectedItems.length < 3) {
      return "${selectedItems.length} of 3 selected";
    } else {
      return "Good Work 🎉";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      isTopPadding: false,
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: Sizes.size40,
            top: Sizes.size16,
            left: Sizes.size40,
            right: Sizes.size40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedItemNumbers(),
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: Sizes.size14,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InterestDetailScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size8,
                  ),
                  decoration: BoxDecoration(
                    color: _isCompleted()
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
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size40,
            ),
            child: Column(
              children: [
                Gaps.v14,
                const Text(
                  "What do you want to see on Twitter?",
                  style: TextStyle(
                    fontSize: Sizes.size28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v20,
                Text(
                  "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                  style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          Gaps.v20,
          const Divider(),
          Gaps.v20,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  return InterestCategoryButton(
                    title: interests[index],
                    onTap: () => _onTap(index),
                    isSelected: selectedItems.contains(index),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
