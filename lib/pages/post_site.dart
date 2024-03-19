import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/componets/cancel_post_buttons.dart';
import 'package:flutter_application_1/componets/textfield.dart';
import 'package:flutter_application_1/database/fiirestore.dart';
import 'package:flutter_application_1/themes/colors.dart';

class EventPostSite extends StatefulWidget {
  const EventPostSite({super.key});

  @override
  State<EventPostSite> createState() => _EventPostSiteState();
}

class _EventPostSiteState extends State<EventPostSite> {
  final TextEditingController userPostController = TextEditingController();

  final FirestoreDatabase database = FirestoreDatabase();

  List<String> items = ["Kuying'alula", "Friends"];

  String selectedItem = "Kuying'alula";

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
      backgroundColor: Theme.of(context).colorScheme.background.withOpacity(1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
              child: Container(
            height: 116,
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 18),
              //the upper top of the page
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // selecting viewers of the post
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //title
                        const Text("Viewers",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        // drop down menu to select type of viewers
                        Container(
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 0.5, color: Theme.of(context).colorScheme.secondary),
                          ),
                          // drop down menu
                          child: DropdownButton<String>(
                            padding: const EdgeInsets.only(left: 12),
                            underline: const SizedBox(height: 0.1),
                            value: selectedItem,
                            icon: const Icon(Icons.arrow_drop_down_rounded),
                            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                            items: items.map((item) => DropdownMenuItem<String>(value: item,
                                      child: Text(item,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedItem = item!),
                          ),
                        )
                      ]),
                  // cancel or post buttons
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8,
                        right: defaultPadding),
                    child: CancelOrPostButtons(
                        onTap: () {
                          // post the event
                          postMessage();
                          // return to the home page after posting the event
                          Navigator.pop(context);
                        },
                        text: 'Post')
                  )
                ],
              ),
            ),
          )),
          // the rest of the page start here
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 4.0, bottom: 20),
              child: MyTextField(
                  hintText: "Be the first Kuying'alula!! ",
                  // obscureTex: false,
                  controller: userPostController),
            ),
          ),
        ],
      ),
    );
  }
}
