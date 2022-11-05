import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemedicine/admin/login.dart';
import 'package:telemedicine/doctors/doctor_login.dart';
import 'package:telemedicine/patients/patient_login.dart';


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 23, 23),
        leading: Text("HOME", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
      ),
      body: Container(
        child: new SingleChildScrollView(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                      child: Text('Select Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => P_LoginPage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Patient", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
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
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Doctor", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: 'Telemedicine',)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Admin", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Montserrat", fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        )
      )
    );
  }
}