import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/add_new_event.dart';
// import 'package:flutter_application_1/componets/drawer.dart';
import 'package:flutter_application_1/database/fiirestore.dart';
import 'package:flutter_application_1/componets/posted_events.dart';
import 'package:flutter_application_1/themes/colors.dart';

class TabletScreen extends StatelessWidget {
  TabletScreen({super.key});
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
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ))
        ],
      ),

// side navigation via drawer
      // drawer: const MyDrawer(),
// the main body of the app
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // posts messages
          PostedEvents(),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: defaultPadding),
        child: addNewEvent(context),
      ),
    );
  }
}
