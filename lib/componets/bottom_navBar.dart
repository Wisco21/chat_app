// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//   bool _isVisible = true;
//   ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         setState(() {
//           _isVisible = false;
//         });
//       } else if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         setState(() {
//           _isVisible = true;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   final List<BottomNavigationBarItem> _items = const [
//     BottomNavigationBarItem(
//       icon: Icon(Icons.home),
//       label: 'Home',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.search),
//       label: 'search',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.group),
//       label: 'commute',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.notifications_none_rounded),
//       label: 'updates',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.mail_outline),
//       label: 'mails',
//     ),
//   ];
//   // const [
//   //   NavigationDestination(
//   //     icon: Icon(Icons.home),
//   //     label: '',
//   //   ),
//   //   NavigationDestination(
//   //     icon: Icon(Icons.search),
//   //     label: '',
//   //   ),
//   //   NavigationDestination(
//   //     icon: Icon(Icons.group),
//   //     label: '',
//   //   ),
//   //   NavigationDestination(
//   //     icon: Icon(Icons.notifications_none_rounded),
//   //     label: '',
//   //   ),
//   //   NavigationDestination(
//   //     // selectedIcon: Icon(Icons.language),
//   //     icon: Icon(Icons.mail_outline),
//   //     label: '',
//   //   ),
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       height: _isVisible ? 56.0 : 0.0,
//       duration: const Duration(milliseconds: 200),
//       child: Wrap(children: [
//         BottomNavigationBar(
//           onTap: _onItemTapped,
//           items: _items,
//           currentIndex: _selectedIndex,
//           selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
//           unselectedItemColor: Theme.of(context).colorScheme.primary,
//         ),
//       ]),
//     );
//   }
// }
