import 'package:flutter/material.dart';
import 'package:tiktok_clone/assignment/thread/widget/thread_item.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: Sizes.size40,
          width: Sizes.size40,
          child: Image.asset("images/threads-logo.png", fit: BoxFit.contain),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
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
        ),
      ),
    );
  }
}
