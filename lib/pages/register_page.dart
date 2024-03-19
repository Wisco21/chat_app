// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/button.dart';
import 'package:flutter_application_1/componets/textfield.dart';
import 'package:flutter_application_1/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // register method
  void registerUser() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    //make sure password match
    //if password don't match
    if (passwordController.text != confirmPasswordController.text) {
      //pop a loading circle
      Navigator.pop(context);

      //show error message to user
      displayMessageToUser("Password don't match", context);
    }

    // if password do match
    else {
      //try creating the user
      try {
        //create the user
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        //create a user document and add it to the firestore
        createUserDocument(userCredential);

        //pop loading circle
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        Navigator.pop(context);

        //display message to the user
        displayMessageToUser(e.code, context);
      }
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': userNameController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // app name
               Text(
                'SOBAF',
                style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.secondary
                ),
              ),
              const SizedBox(height: 25),

              // userName  textfield
              LogRegTextField(
                lableText: "Username",
                obscureTex: false,
                controller: userNameController,
              ),
              const SizedBox(height: 12),

              // email  textfield
              LogRegTextField(
                lableText: "baf20-finale@poly.ac.mw",
                obscureTex: false,
                controller: emailController,
              ),
              const SizedBox(height: 12),

              //password  textfield
              LogRegTextField(
                lableText: "Password",
                obscureTex: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),

              //confirm password  textfield
              LogRegTextField(
                lableText: "Confirm Password",
                obscureTex: true,
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 20),

              //sign in here
              MyButton(
                text: 'Register',
                onTap: registerUser,
              ),
              const SizedBox(height: 13),

              // if you don't have an account the register here
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child:  Text(
                        "Login Now",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,
                            color: Theme.of(context).colorScheme.secondary
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
