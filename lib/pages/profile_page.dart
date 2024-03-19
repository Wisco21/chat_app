import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // current Loggged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  //future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }
// log out
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserDetails(),
          builder: (context, snapshot) {
            //loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //error
            else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            //display the data
            else if (snapshot.hasData) {
              //extract data
              Map<String, dynamic>? user = snapshot.data!.data();
              return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Theme.of(context).colorScheme.background,
                               ),
                body: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                    ),
                    alignment: Alignment.center,
                    child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // profile photo
                        const Padding(
                          padding:  EdgeInsets.only(top: 18.0),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [CircleAvatar(
                                radius: 45,
                                child: Icon(Icons.person, size: 45)
                            ),],),
                        ),
                        Container(
                          width: 370,
                          height: 550,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                const BoxShadow(
                                  //color: Colors.grey.shade500,
                                  color: Colors.white,
                                  blurRadius: 0.5,
                                  spreadRadius: 1.0,
                                  offset: const Offset(-4.0, -4.0),
                                ),
                                BoxShadow(
                                  //color: Colors.white,
                                  color: Colors.grey.shade500,
                                  blurRadius: 0.5,
                                  spreadRadius: 1.0,
                                  offset: Offset(4.0, 4.0),
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 10),
                              // user name ---------------------------------
                              Text(user!['username'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                              // registered email ---------------------------------
                              Text(
                                user['email'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color:
                                    Theme.of(context).colorScheme.inversePrimary),
                              ),
                              // the divider line
                              Divider(
                                height: 18,
                                thickness: 0.5,
                                indent: 8,
                                endIndent: 8,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              //  notifications part
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
                                    child: ListTile(
                                      title: const Text('N O T I F I C A T I O N S', style: TextStyle(color: Colors.grey,)),
                                      trailing: const Icon(
                                        Icons.notifications,
                                        size: 32,
                                        color: Colors.grey,
                                      ),
                                      onTap: (){},
                                    ),
                                  ),
                                  // Settings
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
                                    child: ListTile(
                                      title: const Text('S E T T I N G S', style: TextStyle(color: Colors.grey,),),
                                      trailing: const Icon(
                                        Icons.settings,
                                        size: 32,
                                        color: Colors.grey,
                                      ),
                                      onTap: (){},
                                    ),
                                  ),
                                  // theme app
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
                                    child: ListTile(
                                      title: const Text('T H E M E', style: TextStyle(color: Colors.grey,)),
                                      trailing: const Icon(
                                        Icons.dark_mode_outlined,
                                        size: 32,
                                        color: Colors.grey,
                                      ),
                                      onTap: (){},
                                    ),
                                  ),
                                  // the divider line
                                  Divider(
                                    height: 18,
                                    thickness: 0.5,
                                    indent: 8,
                                    endIndent: 8,
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
                                child: ListTile(
                                  title: const Text('L O G O U T'),
                                  trailing: const Icon(
                                    Icons.logout,
                                    size: 32,
                                  ),
                                  onTap: logout,
                                ),
                              )
                            ],),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Text('No data');
            }
          }),
    );
  }
}
