// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/componets/min_menu.dart';
// import 'package:flutter_application_1/pages/home_page.dart';
// import 'package:flutter_application_1/pages/profile_page.dart';
// import 'package:flutter_application_1/pages/users_page.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

// class HiddenDrawer extends StatefulWidget {
//   const HiddenDrawer({super.key});

//   @override
//   State<HiddenDrawer> createState() => _HiddenDrawerState();
// }

// class _HiddenDrawerState extends State<HiddenDrawer> {
//   List<ScreenHiddenDrawer> pages = [];

// // textstyles for navigaton menu names
//   final isSelected = const TextStyle(
//       fontWeight: FontWeight.bold,
//       // letterSpacing: 1.5,
//       fontSize: 22,
//       color: Colors.white);

//   final isNotSelected = const TextStyle(
//     fontSize: 22,
//     color: Colors.grey,
//     fontWeight: FontWeight.bold,
//   );
//   // end here
//   @override
//   void initState() {
//     super.initState();

// //nagations pages
//     pages = [
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'HomePage',
//           baseStyle: isNotSelected,
//           selectedStyle: isSelected,
//           colorLineSelected: const Color(0xFF029791),
//         ),
//         const HomePage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'ProfilePage',
//           baseStyle: isNotSelected,
//           selectedStyle: isSelected,
//           colorLineSelected: const Color(0xFF029791),
//         ),
//         ProfilePage(),
//       ),
//       ScreenHiddenDrawer(
//         ItemHiddenMenu(
//           name: 'UsersPage',
//           baseStyle: isNotSelected,
//           selectedStyle: isSelected,
//           colorLineSelected: const Color(0xFF029791),
//         ),
//         const UsersPage(),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       backgroundColorMenu: Theme.of(context).colorScheme.secondary,

//       //nagations pages
//       screens: pages,
//       initPositionSelected: 0,
//       slidePercent: 40,
//       backgroundColorAppBar: Theme.of(context).colorScheme.background,
//       // disableAppBarDefault: true,
//       leadingAppBar: const Icon(Icons.menu),
//       tittleAppBar: const Text(
//         'EPlugs',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
//       ),

//       actionsAppBar: [
//         //min menu
//         minMenu(context)
//       ],
//     );
//   }
// }
