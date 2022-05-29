import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:transpot/Allwidgets/Divider.dart';
import 'package:transpot/login.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class mainscreen extends StatefulWidget {

  static const String idscreen = "mainscreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}



class _MainScreenState extends State<mainscreen> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Transpot"), actions: [ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance
              .signOut()
              .whenComplete(() => Navigator.pushNamed(context, Login.idScreen));
          // navigate to login screen
        },
        child: Text("Logout"),
      ),],
      ),
      drawer: Container(
        color: Colors.white,
        width: 255.0,
        child: Drawer (
          child: ListView(
            children: [
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration (color: Colors.blue),
                  child: Row(
                    children: [
                      Image.asset("images/user_icon.png", height: 65.0, width: 65.0,),
                      SizedBox(width: 16.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Profile Name", style: TextStyle(fontSize: 16.0),),
                          SizedBox(height: 6.0,),
                          Text("visit profile")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              DividerWidget(),

              SizedBox(height: 12.0,),
              ListTile(
                leading: Icon(Icons.history),
                title: Text ("History", style: TextStyle(fontSize: 16.0),),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text ("visit profile", style: TextStyle(fontSize: 16.0),),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text ("About", style: TextStyle(fontSize: 16.0),),
              ),




            ],
          ),
        ),

      ),
      body: Stack (
        children: [
          GoogleMap (
            initialCameraPosition: CameraPosition(
              target: LatLng(30.067943 , 31.217244),
              zoom: 14.4746,

            ),
          ),
          Positioned(
            top: 45.0,
            left: 22.0,
            child: GestureDetector(
              onTap: ()
              {

              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(22.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 6.0,
                      spreadRadius: 0.5,
                      offset: Offset(
                        0.7, 0.7
                      ),
                    ),
                  ],
                ),
                child: CircleAvatar (
                  backgroundColor: Colors.white,
                  child: Icon(Icons.menu, color: Colors.black),
                ),
              ),
            ),
          ),
          Positioned(child: Container (
            height: 260.0,
            decoration: BoxDecoration (
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 16.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7, 0.7),
                ),
              ],

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,

                children: [
                  SizedBox(height: 6.0),
                  Text("Hello ", style: TextStyle(fontSize: 10.0),),
                  Text("where to ", style: TextStyle(fontSize: 20.0, fontFamily: "Brand-Bold"),),
                  SizedBox(height: 6.0),
                  Container(
                    decoration:  BoxDecoration (
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 6.0,
                          spreadRadius: 0.5,
                          offset: Offset(0.7, 0.7),
                        ),
                      ],

                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.blue[32],),
                        SizedBox(width: 12.0, height: 3.0,),
                        Text("Search drop off"),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0,),
                  Row(
                    children: [
                      Icon(Icons.home, color: Colors.blue,),
                      SizedBox(width: 12.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add home"),
                          SizedBox(height: 4.0,),
                          Text("Add work"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  DividerWidget(),
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Icon(Icons.work, color: Colors.blue,),
                      SizedBox(width: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add home"),
                          SizedBox(height: 4.0,),
                          Text("Add office work"),
                        ],
                      ),
                    ],
                  ),


                ],

              ),
            ),
          ),





          ),





        ],



      )




    );
  }
}
