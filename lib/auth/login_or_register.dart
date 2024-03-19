import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/register_page.dart';

import '../pages/login-page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initialy show the login page
  bool showLoginPage = true;

  //switch between login and register pages
  void tagglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: tagglePages);
    } else {
      return RegisterPage(onTap: tagglePages);
    }
  }
}
