import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth.dart';
import 'package:flutter_application_1/auth/login_or_register.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/componets/posted_events.dart';
import 'package:flutter_application_1/pages/chat_page.dart';
import 'package:flutter_application_1/pages/post_site.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/commute_page.dart';
import 'themes/dark-mode.dart';
import 'themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applications
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const PostedEvents(),
        '/profile_page': (context) => ProfilePage(),
        '/users_page': (context) => const CommunityPage(),
        '/post_site': (context) => const EventPostSite(),
        '/chat_page': (context) => const ChatPage()
      },
    );
  }
}
