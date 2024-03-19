// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class EventProfile extends StatelessWidget {
//   EventProfile({super.key});

//   // current Loggged in user
//   final User? currentUser = FirebaseAuth.instance.currentUser;

//   //future to fetch user details
//   Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
//     return await FirebaseFirestore.instance
//         .collection("Users")
//         .doc(currentUser!.email)
//         .get();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//         future: getUserDetails(),
//         builder: (context, snapshot) {
//           //loading
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           //error
//           else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           //display the data
//           else if (snapshot.hasData) {
//             //extract data
//             Map<String, dynamic>? user = snapshot.data!.data();
//             return Text(
//               user!['username'],
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Theme.of(context).colorScheme.inversePrimary),
//             );
//           } else {
//             return const Text('No data');
//           }
//         });
//   }
// }
