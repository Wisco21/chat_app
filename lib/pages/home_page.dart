import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/new_pots_tile.dart';
import 'package:flutter_application_1/database/fiirestore.dart';
import 'package:flutter_application_1/pages/commute_page.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../componets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _PostedEventsState();
}

class _PostedEventsState extends State<HomePage> {
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
//
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
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            body: CustomScrollView(
              // physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerScrolled) => [
                      SliverAppBar(

                        stretch: true,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        elevation: 0,
                        scrolledUnderElevation: 0,
                        floating: true,
                        pinned: true,
                        // snap: true,
                        expandedHeight: 100,
                        title:  Text(
                          'SOBAF',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        bottom: TabBar(
                          tabAlignment: TabAlignment.center,
                            indicatorColor: Theme.of(context).colorScheme.secondary,
                            dividerColor:
                                Theme.of(context).colorScheme.background,
                            labelColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            unselectedLabelColor:
                                Theme.of(context).colorScheme.primary,
                            unselectedLabelStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            tabs: const [
                              Tab(
                                text: 'Updates',
                              ),
                              Tab(text: 'Candidates')
                            ]),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            color: Theme.of(context).colorScheme.background,
                            // child: Image.asset(
                            //   'lib/assets/image/ph1.jpeg',
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          titlePadding: EdgeInsets.zero,
                          centerTitle: true,
                        ),
                      ),
                    ],
                    body: TabBarView(children: [
                      SizedBox(
                        child: ListView.builder(
                            itemBuilder: (BuildContext context, index) {
                          //get each post
                          final post = posts[index];

                          String message = post['PostMessage'];
                          String userEmail = post['UserEmail'];
                          Timestamp timestamp = post['TimeStamp'];
                          DateTime dateTime = timestamp.toDate();
                          String relativeTime = timeago.format(
                            dateTime,
                            allowFromNow: true,
                          );
                          String formattedTime = "";
                          if (relativeTime.contains("just now")) {
                            formattedTime = relativeTime;
                          } else if (relativeTime.contains("minutes ago")) {
                            formattedTime =
                                relativeTime.replaceAll("minutes ago", "mins");
                          } else if (relativeTime.contains("hours ago")) {
                            formattedTime =
                                relativeTime.replaceAll("hours ago", "hrs");
                          } else if (relativeTime.contains("days ago")) {
                            formattedTime =
                                relativeTime.replaceAll("days ago", "d");
                          } else if (relativeTime
                              .contains("about a month ago")) {
                            formattedTime = relativeTime.replaceAll(
                                "about a month ago", "mnth");
                          } else if (relativeTime
                              .contains("about months ago")) {
                            formattedTime = relativeTime.replaceAll(
                                "about months ago", "months");
                          } else if (relativeTime.contains("about year ago")) {
                            formattedTime =
                                relativeTime.replaceAll("about year ago", "yr");
                          }

                          // relativeTime =
                          //     relativeTime.replaceAll('days ago', 'd ago');
                          return NewPosts(
                            email: userEmail,
                            event: message,
                            timeStamp: formattedTime,
                          );
                          // return TestTile(
                          //   email: userEmail,
                          //   event: message,
                          //   timeStamp: formattedTime,
                          // );
                        }),
                      ),
                      const CommunityPage(),
                    ]),
                  ),
                )
                //
              ],
            ),

          ),
        );
      },
    );
  }
}
