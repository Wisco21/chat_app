import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/colors.dart';

FloatingActionButton addNewEvent(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: inverseColor,
    elevation: 10,
    onPressed: () {
      // const EventPostSite();
      Navigator.pushNamed(context, '/post_site');
    },
    child: const Icon(
      Icons.add,
      color: Colors.white,
    ),
  );
}
