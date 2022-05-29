import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:transpot/login.dart';
import 'package:transpot/mainscreen.dart';
import 'package:transpot/Registeration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // init firestore

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transpot',
      theme: ThemeData(
        fontFamily: "Brand-Regular",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Login.idScreen,
      routes: {
        Registeration.idScreen: (context) => Registeration(),
        Login.idScreen: (context) => Login(),
        mainscreen.idscreen: (context) => mainscreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
