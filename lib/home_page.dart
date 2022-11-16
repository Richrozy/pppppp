import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine/admin/login.dart';
import 'package:telemedicine/doctors/doctor_login.dart';
import 'package:telemedicine/patients/patient_login.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 23, 23),
        title: Text("Dashboard",
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
        )
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: GridView(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 39, 6, 100),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outline_outlined, size: 60, color: Colors.white,),
                      Text("Admin", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => P_LoginPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 18, 59, 71),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.medication, size: 60, color: Colors.white,),
                      Text("Patient",
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
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => D_LoginPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 77, 8, 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.medical_services, size: 60, color: Colors.white,),
                      Text("Doctor", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  //
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 45, 109, 8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.exit_to_app_outlined, size: 60, color: Colors.white,),
                      Text("Exit App", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
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