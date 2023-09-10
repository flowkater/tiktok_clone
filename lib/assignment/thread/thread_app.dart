import 'package:flutter/material.dart';
import 'package:tiktok_clone/assignment/thread/screens/main_navigation_screen.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ThreadApp extends StatelessWidget {
  const ThreadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thread',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF1DA1F2),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF1DA1F2),
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFF1DA1F2),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF1DA1F2),
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
