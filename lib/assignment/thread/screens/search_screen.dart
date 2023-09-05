import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/assignment/thread/model/activity_model.dart';
import 'package:tiktok_clone/assignment/thread/widget/activity_list_tile.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  void _onSearchChanged(String value) {
    print("Searching form $value");
  }

  void _onSearchSubmitted(String value) {
    print("Submitted $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Search",
            style: TextStyle(
              fontSize: Sizes.size32,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(Sizes.size40),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
            ),
            child: CupertinoSearchTextField(
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
                vertical: Sizes.size10,
              ),
              placeholder: "Search",
              style: const TextStyle(
                fontSize: Sizes.size16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(Sizes.size12),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size16,
        ),
        child: ListView.separated(
          itemCount: searchList.length,
          itemBuilder: (context, index) {
            return SearchListTile(
              name: searchList[index].name,
              message: searchList[index].message,
              subMessage: searchList[index].subMessage,
              image: searchList[index].image,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
