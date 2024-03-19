import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
this database stores messages that have been published by the user
they are stored in a collection called: 'posts' in firebase
each post will contain
=> a message
=> email of the user
=> timestamp
*/

class FirestoreDatabase {
  // name of the logged in user
  User? user = FirebaseAuth.instance.currentUser;

  //collect all posts from firebase
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');

  //post messages
  Future<void> addPost(String message) {
    return posts.add({
      // 'UserName': user,
      'UserEmail': user!.email,
      'PostMessage': message,
      'TimeStamp': Timestamp.now(),
    });
  }

  //read posted messages from database
  Stream<QuerySnapshot> getPostsStream() {
    final postsStream = FirebaseFirestore.instance
        .collection('posts')
        .orderBy('TimeStamp', descending: true)
        .snapshots();

    return postsStream;
  }
}
