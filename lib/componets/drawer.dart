import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // drawer header
          Column(
            children: [
              const DrawerHeader(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'P/O',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 58),
                  )
                ],
              )),

              // home page
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 32,
                  ),
                  title: const Text('H O M E'),
                  onTap: () {
                    //since were already on the home page (will just dismiss the drawer)
                    Navigator.pop(context);
                  },
                ),
              ),

              // profile page
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    size: 32,
                  ),
                  title: const Text('P R O F I L E'),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    //navigater to the profile page
                    Navigator.pushNamed(context, '/profile_page');
                  },
                ),
              ),

              //user page
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.people,
                    size: 32,
                  ),
                  title: const Text('U S E R S'),
                  onTap: () {
                    // pop the drawer
                    Navigator.pop(context);

                    //navigater to the users page
                    Navigator.pushNamed(context, '/users_page');
                  },
                ),
              ),
            ],
          ),

          // log outs
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
            child: ListTile(
              title: const Text('L O G O U T'),
              trailing: const Icon(
                Icons.logout,
                size: 42,
              ),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
