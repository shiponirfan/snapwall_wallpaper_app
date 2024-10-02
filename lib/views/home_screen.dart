import 'package:flutter/material.dart';
import 'package:snapwall/widgets/appbar_widget.dart';
import 'package:snapwall/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.sizeOf(context);
    return const Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SearchWidget(),
          ],
        ),
      ),
    );
  }
}
