import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/componets/button.dart';
import 'package:flutter_application_1/componets/textfield.dart';
import 'package:flutter_application_1/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // logn method
  void login() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    // try signing in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      //pop the loading circle
      if (context.mounted) Navigator.pop(context);

      // catching the error
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
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
                    color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(height: 25),

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

              //forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forget password?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              //sign in here
              MyButton(
                text: 'Login',
                onTap: login,
              ),
              const SizedBox(height: 13),

              // if you don't have an account the register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You don't have an account?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
