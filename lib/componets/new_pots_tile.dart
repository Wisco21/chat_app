import 'package:flutter/material.dart';

class NewPosts extends StatelessWidget {
  final String email;
  final String event;
  final String timeStamp;
  const NewPosts(
      {super.key,
      required this.email,
      required this.event,
      required this.timeStamp});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // user profile
      Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: CircleAvatar(
          radius: 18.0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(
            Icons.person,
            size: 15,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
      const SizedBox(width: 4),
      Expanded(
        child: Card(
          elevation: 1.8,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 8.0, right: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // upper part of the  app
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // user name and email
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('UserName',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            )),
                        Text(email,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            )),
                      ],
                    ),
                    const Expanded(child: Spacer()),
                    // timestamp
                    Text(timeStamp, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(width: 8.0),
                    //option icon on post
                    const Icon(Icons.more_horiz),
                  ],
                ),
                const SizedBox(height: 8.0),
                // the actual posts
                Text(
                  event,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                //divider part
                const Divider(
                  height: 18,
                  thickness: 0.2,
                  indent: 8,
                  endIndent: 8,
                ),
                // comments, like, and share part
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.comment,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.share,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
