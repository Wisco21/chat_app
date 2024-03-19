import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/list_tile.dart';
import 'package:flutter_application_1/componets/textfield.dart';
import 'package:flutter_application_1/helper/helper_function.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  // void Function()? onTap;
  _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: const Center(
            child: Text('This is a bottom sheet.'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context, snapshot) {
            //any error
            if (snapshot.hasError) {
              displayMessageToUser('Something went wrong', context);
            }

            //show loading circle
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            //get all users
            if (snapshot.data == null) {
              return const Text('No data');
            }

            final users = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        // get individual user
                        final user = users[index];

                        //getting data from each user
                        String username = user['username'];
                        String email = user['email'];

                        return GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/chat_page'),
                          child: PostListTile(
                            title: username,
                            subtitle: email,
                          ),
                        );
                      }),
                ),
              ],
            );
          }),
      /*floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF40A8C4),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  elevation: 25,
                  shadowColor: Colors.blueGrey.shade800,
                  child: Container(
                    width: 300,
                    height: 200,
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Let's connect!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SearchTextField(hintText: 'baf20-wmaganga'),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Connect',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
          foregroundColor: Colors.white),*/
    );
  }
}
