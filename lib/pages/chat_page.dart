import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/min_menu.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'User',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        actions: [minMenu(context)],
      ),
      body: Column(
        children: [
          const Expanded(
            child: SizedBox(
              child: Center(
                  child: Text(
                'Coming Soon',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              )),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.background,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18)),
                            hintText: 'Say Something',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    ),

                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
