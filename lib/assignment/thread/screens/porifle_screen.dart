import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/assignment/thread/screens/settings_screen.dart';
import 'package:tiktok_clone/assignment/thread/widget/thread_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leading: const Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: FaIcon(FontAwesomeIcons.earthAsia),
                ),
                actions: [
                  const FaIcon(FontAwesomeIcons.instagram),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                    child: const FaIcon(FontAwesomeIcons.bars),
                  ),
                  const SizedBox(width: 24),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(200),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Jane",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "jane_mobbine",
                                    ),
                                    const SizedBox(width: 4.0),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 4.0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade100,
                                      ),
                                      child: const Text(
                                        "threads.net",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                const Text("Plant enthusiast!"),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                const Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 10.0,
                                      backgroundImage: NetworkImage(
                                        "https://cdn.womaneconomy.co.kr/news/photo/202307/218088_425579_3146.jpg",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      "2 followers",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                "https://cdn.womaneconomy.co.kr/news/photo/202307/218088_425579_3146.jpg",
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: const Text(
                                  "Edit Profile",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 18.0,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: const Text(
                                  "Share Profile",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 12.0,
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        if (index % 2 == 0) {
                          return const ThreadItem(
                            imageUrls: [
                              "https://images.unsplash.com/photo-1682687219356-e820ca126c92?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80"
                            ],
                          );
                        }
                        if (index == 3) {
                          return const ThreadItem(
                            imageUrls: [
                              "https://images.unsplash.com/photo-1692739850267-6929bdd167df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3087&q=80",
                              "https://images.unsplash.com/photo-1682687219356-e820ca126c92?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
                              "https://images.unsplash.com/photo-1682686580452-37f1892ee5e8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3175&q=80",
                              "https://img.khan.co.kr/news/2023/07/20/news-p.v1.20230715.46688ac1c3f844259ee821d6a75eb2e2_P1.jpg",
                            ],
                          );
                        }
                        return const ThreadItem(
                          imageUrls: [],
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        if (index % 2 == 0) {
                          return const ThreadItem(
                            imageUrls: [
                              "https://images.unsplash.com/photo-1682687219356-e820ca126c92?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80"
                            ],
                          );
                        }
                        if (index == 3) {
                          return const ThreadItem(
                            imageUrls: [
                              "https://images.unsplash.com/photo-1692739850267-6929bdd167df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3087&q=80",
                              "https://images.unsplash.com/photo-1682687219356-e820ca126c92?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
                              "https://images.unsplash.com/photo-1682686580452-37f1892ee5e8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3175&q=80",
                              "https://img.khan.co.kr/news/2023/07/20/news-p.v1.20230715.46688ac1c3f844259ee821d6a75eb2e2_P1.jpg",
                            ],
                          );
                        }
                        return const ThreadItem(
                          imageUrls: [],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: const TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black,
        indicatorWeight: 0.5,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        labelPadding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        tabs: [
          Text(
            "Threads",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Replies",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 38;

  @override
  double get minExtent => 38;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
