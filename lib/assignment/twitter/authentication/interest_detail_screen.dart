import 'package:flutter/material.dart';
import 'package:tiktok_clone/assignment/twitter/widget/interest_detail_button.dart';
import 'package:tiktok_clone/assignment/twitter/widget/layout.dart';
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

class InterestDetailScreen extends StatefulWidget {
  const InterestDetailScreen({super.key});

  @override
  State<InterestDetailScreen> createState() => _InterestDetailScreenState();
}

class _InterestDetailScreenState extends State<InterestDetailScreen> {
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size8,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Interests are used to personalize your experience and will be visible on your profile.",
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
          const Padding(
            padding: EdgeInsets.only(left: Sizes.size20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Music",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v20,
                HorizontalGridView(),
                Text(
                  "Entertainment",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gaps.v20,
                HorizontalGridView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalGridView extends StatelessWidget {
  const HorizontalGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.vertical,
          runSpacing: 10,
          spacing: 10,
          children: [
            for (var interest in interests)
              InterestDetailButton(interest: interest),
          ],
        ),
      ),
    );
  }
}
