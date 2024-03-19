import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.arrow_back,
            size: 31,
          )),
    );
  }
}
