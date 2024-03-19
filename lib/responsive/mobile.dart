import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/post_site.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/seerch_page.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});
  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _selectedIndex = 0;

  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    EventPostSite(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,

        // the main body of the app
        body: _pages[_selectedIndex],

        // floating button for adding new events
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _navigationBottomBar,
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.background,
            selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
            unselectedItemColor: Theme.of(context).colorScheme.primary,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_rounded),
                label: 'drawer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add_rounded),
                label: 'post',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Profie',
              ),
            ]),
      ),
    );
  }
}
