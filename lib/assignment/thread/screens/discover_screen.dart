import 'package:flutter/material.dart';
import 'package:tiktok_clone/assignment/thread/model/activity_model.dart';
import 'package:tiktok_clone/assignment/thread/utils/utils.dart';
import 'package:tiktok_clone/assignment/thread/widget/activity_list_tile.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'dart:math';

List<T> shuffleList<T>(List<T> list, int seed) {
  final random = Random(seed);

  for (var i = list.length - 1; i > 0; i--) {
    final j = random.nextInt(i + 1);
    final temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }

  return list;
}

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final tabs = [
    "All",
    "Replies",
    "Mentions",
    "Verified",
    "Media",
    "Likes",
  ];

  late final TabController _tabController =
      TabController(vsync: this, length: tabs.length);

  int _currentTabIndex = 0;

  @override
  void initState() {
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text("Activity",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w800,
                )),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(Sizes.size60),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              labelStyle: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.size12),
                // color: Colors.black,
              ),
              indicatorPadding: EdgeInsets.zero,
              // labelColor: Colors.white,
              // unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: Sizes.size4,
              ),
              tabs: [
                for (var i = 0; i < tabs.length; i++)
                  Tab(
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size12),
                        border: Border.all(
                            color: i == _currentTabIndex
                                ? isDark
                                    ? Colors.white
                                    : Colors.black
                                : Colors.transparent),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          tabs[i],
                          style: const TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            for (var i = 0; i < tabs.length; i++)
              AllListView(
                tabIndex: i,
              ),
          ],
        ),
      ),
    );
  }
}

class AllListView extends StatefulWidget {
  final int tabIndex;
  const AllListView({
    required this.tabIndex,
    super.key,
  });

  @override
  State<AllListView> createState() => _AllListViewState();
}

class _AllListViewState extends State<AllListView> {
  late final List<ActivityModel> _activities;

  @override
  void initState() {
    _activities =
        shuffleList(generateActivityList(widget.tabIndex), widget.tabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size16,
        horizontal: Sizes.size16,
      ),
      child: ListView.separated(
        itemCount: _activities.length,
        itemBuilder: (context, index) {
          return ActivityListTile(
            name: _activities[index].name,
            time: _activities[index].time,
            message: _activities[index].message,
            subMessage: _activities[index].subMessage,
            image: _activities[index].image,
            isFollowing: _activities[index].isFollowing,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
