import 'package:flutter/material.dart';

class TabBarMenu extends StatelessWidget {
  const TabBarMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        tabAlignment: TabAlignment.center,
        dividerColor: Theme.of(context).colorScheme.background,
        labelColor: Theme.of(context).colorScheme.inversePrimary,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        unselectedLabelColor: Theme.of(context).colorScheme.primary,
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        tabs: const [
          Tab(
            text: 'For you',
          ),
          Tab(text: 'Chats')
        ]);
  }
}


//  SliverList.builder(
//               itemCount: posts.length,
//               itemBuilder: (BuildContext context, index) {
//                 //get each post
//                 final post = posts[index];

//                 // get data from each post
//                 // String userName = post['UserName'];
//                 String message = post['PostMessage'];
//                 String userEmail = post['UserEmail'];
//                 Timestamp timestamp = post['TimeStamp'];
//                 DateTime dateTime = timestamp.toDate();
//                 String relativeTime = timeago.format(
//                   dateTime,
//                   allowFromNow: true,
//                 );

//                 return TestTile(
//                   email: userEmail,
//                   event: message,
//                   timeStamp: relativeTime,
//                 );
//               }),
