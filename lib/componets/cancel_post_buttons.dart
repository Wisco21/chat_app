import 'package:flutter/material.dart';

class CancelOrPostButtons extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const CancelOrPostButtons({
    super.key,
    required this.onTap,
    required this.text,
    // required this.style
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: Theme.of(context).colorScheme.secondary,)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
