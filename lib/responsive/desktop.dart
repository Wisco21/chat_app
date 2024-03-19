import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/add_new_event.dart';
import 'package:flutter_application_1/componets/drawer.dart';
// import 'package:flutter_application_1/componets/drawer.dart';
import 'package:flutter_application_1/database/fiirestore.dart';
import 'package:flutter_application_1/componets/posted_events.dart';
import 'package:flutter_application_1/themes/colors.dart';

class DesktopScreen extends StatelessWidget {
  DesktopScreen({super.key});
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
      backgroundColor: Theme.of(context).colorScheme.background,

// the main body of the app
      body: Row(
        children: [
// side navigation via drawer
          const MyDrawer(),
          // the rest of the body starts here
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // here will add the header menu
                  Container(
                    color: Colors.amber,
                    height: 100,
                  ),

                  // posts messages
                  Expanded(
                    child: Row(
                      children: [
// posted events are the floating buutton for adding new events
                        const Expanded(
                          flex: 4,
                          child: PostedEvents(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                  child: Container(
                                color: Colors.deepPurple,
                              )),
                              Expanded(
                                  child: Container(
                                color: Colors.lightBlue,
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: // floating button for adding new events
          Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 350, 0),
        child: addNewEvent(context),
      ),
    );
  }
}
