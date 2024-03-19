import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/new_pots_tile.dart';
import 'package:flutter_application_1/database/fiirestore.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostedEvents extends StatefulWidget {
  const PostedEvents({super.key});

  @override
  State<PostedEvents> createState() => _PostedEventsState();
}

class _PostedEventsState extends State<PostedEvents> {
  final TextEditingController userPostController = TextEditingController();

  final FirestoreDatabase database = FirestoreDatabase();

  //post message
  void postMessage() {
    //only post if there is something in the textfield
    if (userPostController.text.isNotEmpty) {
      String message = userPostController.text;
      database.addPost(message);
    }
//clear the controller after posting the message
    userPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return
// posts messages

        StreamBuilder(
      stream: database.getPostsStream(),
      builder: (context, snapshot) {
        //show loading circle
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        //get all posts
        final posts = snapshot.data!.docs;

        //no data?
        if (snapshot.data == null || posts.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'Be the first person to post...',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          );
        }
        //list all posts
        return Expanded(
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                //get each post
                final post = posts[index];

                // get data from each post
                // String userName = post['UserName'];
                String message = post['PostMessage'];
                String userEmail = post['UserEmail'];
                Timestamp timestamp = post['TimeStamp'];
                DateTime dateTime = timestamp.toDate();
                String relativeTime = timeago.format(
                  dateTime,
                  allowFromNow: true,
                );

                // return the posts as list tile
                return NewPosts(
                  // userName: userName,
                  event: message,
                  email: userEmail, timeStamp: relativeTime,
                );
              }),
        );
      },
    );
  }
}
