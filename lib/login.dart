//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transpot/Allwidgets/progressdialog.dart';
import 'package:transpot/Registeration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transpot/mainscreen.dart';

class Login extends StatelessWidget {
  String email = "";
  String password = "";
  String userId = "";
  var user = null;
  static const String idScreen = "login";
  var db = FirebaseFirestore.instance;

  bool isHiddenPassword = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Image(
                image: const AssetImage("images/logo.png"),
                width: 200.0,
                height: 200.0,
                alignment: Alignment.center,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Login",
                style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Brand Bold",
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      onChanged: (val) {
                        email = val;
                        email = email.trim();

                        print(email);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: "Email",
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      onChanged: (val) {
                        password = val;
                        password = password.trim();

                        print(password);
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        suffixIcon: const InkWell(
                          // onTap: _togglePasswordView,
                          child: Icon(
                            Icons.visibility,
                          ),
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return progressdialog(
                                message: "Authenticating, Please wait...",
                              );
                            });

                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password)
                            .then((value) {
                          userId = value.user!.uid;
                          // get users collections
                          db
                              .collection("users")
                              .doc(userId)
                              .get()
                              .then((value) {
                            user = value.data();
                            print(user);
                            print("user data is here");
                          });
                        }).whenComplete(() => {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      mainscreen.idscreen, (route) => false),
                                });
                      },
                      child: const Text('sign in'),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Registeration.idScreen, (route) => false);
                },
                child: const Text('New User? Register Here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
