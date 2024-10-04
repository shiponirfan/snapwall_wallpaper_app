import 'package:flutter/material.dart';
import 'package:snapwall/views/main_navigation_screen.dart';

class SnapWallApp extends StatelessWidget {
  const SnapWallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SnapWall',
      debugShowCheckedModeBanner: false,
      home: MainNavigationScreen(),
    );
  }
}
