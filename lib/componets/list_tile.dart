import 'package:flutter/material.dart';

class PostListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const PostListTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0,right: 8, left: 8),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.background,
          border: Border.all(width: 0.2, color: Theme.of(context).colorScheme.inversePrimary)
        ),
        child: ListTile(
          // shape: ShapeBorder,
          leading: CircleAvatar(
            radius: 20.0,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              Icons.person,
              size: 18,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          selectedTileColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
