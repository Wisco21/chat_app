import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/commute_page.dart';

class TabTwo extends StatefulWidget {
  const TabTwo({super.key});

  @override
  State<TabTwo> createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<TabTwo> {
  @override
  Widget build(BuildContext context) {
    return const CommunityPage();
  }
}
