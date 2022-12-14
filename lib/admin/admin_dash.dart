import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:telemedicine/patients/patient_login.dart';
import 'package:telemedicine/patients/view_doctors.dart';


class AdminPage extends StatefulWidget{
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 23, 23),
        leading: Text("Dashboard",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
        )
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: GridView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.library_books_sharp, size: 60, color: Colors.white,),
                    Text("Patient Mgt", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.online_prediction_sharp, size: 60, color: Colors.white,),
                    Text("Doctor Mgt",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 22,
                       fontFamily: "Montserrat", 
                       fontWeight: FontWeight.bold
                    ),
                  )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => viewDoctors()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.health_and_safety, size: 60, color: Colors.white,),
                      Text("Add doctors", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 37, 54, 50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.video_camera_front_outlined, size: 60, color: Colors.white,),
                      Text("Settings", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.settings_applications, size: 60, color: Colors.white,),
                    Text("User Feedback", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 240, 162, 61),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.monetization_on, size: 60, color: Colors.white,),
                      Text("Signout", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
          ),
        )
      )
    );
  }
}