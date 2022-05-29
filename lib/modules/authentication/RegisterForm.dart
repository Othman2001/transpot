import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transpot/Allwidgets/Firestore.dart';
import 'package:transpot/login.dart';
import 'package:transpot/mainscreen.dart';

class RegisterForm extends StatelessWidget {
  String email = "";
  String password = "";
  String phoneNumber = "";
  String userId = "";
  var db = FirebaseFirestore.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[400],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              FirestoreDatabase(),
              const Image(
                image: AssetImage("images/logo.png"),
                width: 200.0,
                height: 200.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              const Text(
                "Register",
                style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Brand Bold",
                    color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: "Name",
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 15.0,
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
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: "Phone",
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
                    SizedBox(
                      height: 15.0,
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
                        labelStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        suffixIcon: InkWell(
                          child: Icon(
                            Icons.visibility,
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password)
                            .then((value) => {
                                  userId = value.user!.uid,
                                })
                            .whenComplete(() => {
                                  print("Completed"),
                                  // add email and password to user collection firestore with id
                                  db.collection("users").doc(userId).set({
                                    "email": email,
                                    "password": password,
                                    "phoneNumber": phoneNumber,
                                    "role": "user",
                                    "id": userId,
                                  }),
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      mainscreen.idscreen, ((route) => false)),
                                });
                      },
                      child: Text('sign up'),
                    )
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
