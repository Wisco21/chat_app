import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.background,
    shadowColor: Colors.grey,
    scrolledUnderElevation: 25.0,
    elevation: 0,

    // action min menu
    // actions: [minMenu(context)],
  );
}
