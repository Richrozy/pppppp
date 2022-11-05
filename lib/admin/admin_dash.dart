import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AdminPage extends StatefulWidget{
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //to get size

    //card style
    var CardTextStyle = TextStyle(
      fontFamily: 'Montserrat Regular', 
      fontSize: 14, 
      color: Color.fromRGBO(63, 63, 63, 1));

    return new Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .3,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 55, 90, 85),
              ),
            ),
      
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[

                    Container(
                      height: 64,
                      margin: EdgeInsets.only(bottom: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a/ALm5wu2MYG6v-slyATvgmJO5STNRpXUwVTN82x_faOt2DQ=s96-c'),
                          ),
            
                          SizedBox(width: 16,),
            
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Administrator", style: TextStyle(fontFamily: 'Montserrat Medium', color: Colors.white, fontSize: 20),),
                              Text("0704566203", style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Montserrat Medium'),),
                            ],
                          ),
                        ],
                      ),
                    ),
            
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: <Widget>[
                          Card(
                            shadowColor: Color.fromARGB(255, 92, 66, 66),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),                             
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Ink.image(
                                  image: AssetImage('assets/patient_mgt.png'),
                                  height: 105,
                                  width: 60,
                                ),
                                Text("Patient Mgt", style: CardTextStyle,),
                                SizedBox(height: 8,),
                              ]
                            ),
                          ),
                                
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Ink.image(
                                  image: AssetImage('assets/doctor.png'),
                                  height: 105,
                                  width: 60,
                                ),
                                Text("Doctor Mgt", style: CardTextStyle,),
                                SizedBox(height: 8,),
                              ]
                            ),
                          ),
                                
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Ink.image(
                                  image: AssetImage('assets/add2.png'),
                                  height: 105,
                                  width: 60,
                                ),
                                Text("Add doctors", style: CardTextStyle,),
                                SizedBox(height: 8,),
                              ]
                            ),
                          ),
                                
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Ink.image(
                                  image: AssetImage('assets/communication.png'),
                                  height: 105,
                                  width: 60,
                                ),
                                Text("Communications", style: CardTextStyle,),
                                SizedBox(height: 8,),
                              ]
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}