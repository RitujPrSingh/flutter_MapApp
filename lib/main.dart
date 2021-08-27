import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:map_assignment/login_page/homepage.dart';
import 'package:map_assignment/login_page/sign_in/landingpage.dart';
import 'package:map_assignment/services/Auth.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Map_Assignment',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      home: LandingPage(auth: Auth()),
    );

  }
}

