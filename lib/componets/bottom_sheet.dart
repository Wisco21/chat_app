import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/min_bottom_butten.dart';
import 'package:flutter_application_1/themes/colors.dart';

class bottomSheetMenu extends StatelessWidget {
  const bottomSheetMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // current location of the user based on GTP
            const SizedBox(
                height: 20,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(
                    Icons.location_on_outlined,
                  ),
                  Text('Blantyre, Malawi')
                ])),
            // user profile and details
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // user profile
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Icon(
                    Icons.person,
                    size: 34,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // user name and email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      'example@gmail.com',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomSheetButtons(text: 'Followers: @'),
                BottomSheetButtons(text: 'Following: @'),
              ],
            ),

            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 65.0, vertical: 10),
                  child: Center(
                    child: Text(
                      'Follow',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
