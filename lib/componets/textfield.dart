import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  // final bool obscureTex;
  final TextEditingController controller;

  const MyTextField(
      {super.key,
      required this.hintText,
      // required this.obscureTex,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        //border: Border.all(width: 0.5, color: Theme.of(context).colorScheme.secondary),
          boxShadow: [
            const BoxShadow(
              //color: Colors.grey.shade500,
                color: Colors.white,
                blurRadius: 0.5,
                spreadRadius: 1.0,
                offset:  Offset(4.0, 4.0),
                blurStyle: BlurStyle.inner
            ),
            BoxShadow(
              //color: Colors.white,
                color: Colors.grey.shade500,
                blurRadius: 0.5,
                spreadRadius: 1.5,
                offset: const Offset(-4.0, -4.0),
                blurStyle: BlurStyle.inner
            )
          ]
      ),
      child: TextField(
        // obscureText: true,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary),
        ),
        // obscureText: obscureTex,
        maxLines: null,
        minLines: 1,
        autocorrect: true,
      ),
    );
  }
}

// text filled for login and register pages

class LogRegTextField extends StatelessWidget {
  final String lableText;
  final bool obscureTex;
  final TextEditingController controller;

  const LogRegTextField(
      {super.key,
      required this.lableText,
      required this.obscureTex,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        labelText: lableText,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary),
      ),
      obscureText: obscureTex,
    );
  }
}

class SearchTextField extends StatelessWidget {
  final String hintText;
  // final bool obscureTex;
  // final TextEditingController controller;

  const SearchTextField({
    super.key,
    required this.hintText,
    // required this.obscureTex,
    // required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        hintText: hintText,
        hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary),
      ),
      // obscureText: obscureTex,
    );
  }
}
