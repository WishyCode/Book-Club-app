import 'package:firebase_core/firebase_core.dart';
import 'package:book_club/screens/login/login.dart';
import 'package:book_club/states/currentUser.dart';
import 'package:book_club/utils/our_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure initialization before running the app
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: const OurLogin(),
      ),
    );
  }
}
