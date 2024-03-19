import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/bottom_sheet.dart';

class EventTile extends StatefulWidget {
  final String email;
  final String event;
  const EventTile({
    super.key,
    required this.email,
    required this.event,
  });

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  final Color iconColors = Colors.grey.shade400;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // the whole post tile
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // user profile icon
          GestureDetector(
            onTap: () {
              bottomSheetMenu();
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.person),
            ),
          ),
          const SizedBox(width: 15),
          // the upper part of the tile
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // user name
                    Text(
                      'user',
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(width: 5),
                    // user email
                    Text(
                      widget.email,
                    ),
                    const Spacer(),
                    const Icon(Icons.more_vert)
                  ],
                ),
                // the event posted
                GestureDetector(
                  onTap: () {
                    // Toggle the visibility of the full post content
                    // You can manage this state using a boolean flag (e.g., isExpanded)
                    // Set isExpanded to true when the user taps "See More"
                    setState(() {
                      isExpanded = true;
                    });
                  },
                  child: Text(
                    widget.event,
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded ? null : TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                if (!isExpanded)
                  GestureDetector(
                    onTap: () {
                      // Handle the "See More" button tap
                      // Set isExpanded to true to reveal the full post content
                      setState(() {
                        isExpanded = true;
                      });
                    },
                    child: const Text(
                      "See More",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                const SizedBox(height: 10),
                // viwers options
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // comment
                      Icon(Icons.comment, size: 18, color: iconColors),
                      //like
                      const Icon(Icons.favorite, size: 18, color: Colors.red),
                      //rate
                      const Icon(Icons.star, size: 18, color: Colors.orange),
                      // number of viewers
                      Icon(Icons.bar_chart, size: 18, color: iconColors),
                      // number of shares or forward
                      Icon(Icons.share_outlined, size: 20, color: iconColors),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
