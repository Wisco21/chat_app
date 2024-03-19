import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login_or_register.dart';
// import 'package:flutter_application_1/responsive/desktop.dart';
import 'package:flutter_application_1/responsive/mobile.dart';
// import 'package:flutter_application_1/responsive/responsive.dart';
// import 'package:flutter_application_1/responsive/tablet.dart';
// import 'package:flutter_application_1/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData) {
              return const MobileScreen();
              // return ResponsiveDesign(
              //     mobile: const MobileScreen(),
              //     tablet: TabletScreen(),
              //     desktop: DesktopScreen(),
              //     );
            }

            //user is not logged in
            else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
