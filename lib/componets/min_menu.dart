import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// logOut function
void logout() {
  FirebaseAuth.instance.signOut();
}

final textStyle = TextStyle(color: Colors.grey.shade500);

GestureDetector minMenu(BuildContext context) {
  return GestureDetector(
    onTapDown: (details) {
      showMenu(
        context: context,
        color: Theme.of(context).colorScheme.secondary,
        position: const RelativeRect.fromLTRB(300.0, 50.0, 15.0, 300.0),
        items: [
          PopupMenuItem(
            child: Text(
              'Read',
              style: textStyle,
            ),
          ),
          PopupMenuItem(
            child: Text(
              'Sellect',
              style: textStyle,
            ),
          ),
          PopupMenuItem(
            child: Text(
              'Copy',
              style: textStyle,
            ),
          ),
          PopupMenuItem(
            child: Text(
              'Paste',
              style: textStyle,
            ),
          ),
          PopupMenuItem(
            child: Text(
              'Delete',
              style: textStyle,
            ),
          ),
          const PopupMenuItem(
            onTap: logout,
            child: Text('LogOut'),
          ),
        ],
      );
    },
    child: const Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Icon(Icons.more_vert),
    ),
  );
}
