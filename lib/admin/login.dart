import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:telemedicine/patients/patient_signup.dart';
import 'package:telemedicine/admin/signup.dart';

import 'admin_dash.dart';
import 'signup.dart';
import '../doctors/doctor_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TeleMed",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Form(
      child: new SingleChildScrollView(
        child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 55, 0, 0),
                  child: Text('Admin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                 ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35, left: 20, right: 30),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  validator: validateEmail,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )
                  ),
                ),
                SizedBox(height: 20,),

                TextFormField(
                  controller: _passwordController,
                  validator: validatePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    )
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 5.0,),
                Container(
                  alignment: Alignment(1, 0),
                  padding: EdgeInsets.only(top: 15, left: 20),
                  child: InkWell(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40,),

                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      errorMessage
                    ),
                  ),
                ),
                
                Container(
                  height: 40,
                  
                  child: Material(
                    color: Colors.black,
                    elevation: 7,
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.greenAccent,
                    child: ElevatedButton(
                      
                      onPressed: () async{
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text
                          ).then((value){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()));
                          }).onError((error, stackTrace){
                            print("Error ${error.toString()}");
                          });
                      },
                      child: Text("LOGIN",
                      style: TextStyle(color: Colors.white, fontFamily: "Montserrat", fontWeight: FontWeight.bold),
                      ),
                      ),
                  ),
                ),
                // GestureDetector(
                //   onTap:() async{
                //     print("object");
                //           if(_key.currentState!.validate()) {
                //             try{
                //             await FirebaseAuth.instance.signInWithEmailAndPassword(
                //             email: _emailController.text.trim(),
                //             password: _passwordController.text.trim(),
                //           );
                //           errorMessage = '';
                //             }
                //             on FirebaseAuthException catch (error){
                //               errorMessage = error.message!;
                //             }
                //             Navigator.push(context, MaterialPageRoute(builder: ((context) => AdminPage())));
                //          }
                //         },
                //   child: Container(
                //     height: 50, 
                //     child: Material(
                //       borderRadius: BorderRadius.circular(20),
                //       shadowColor: Colors.greenAccent,
                //       color: Colors.black,
                //       elevation: 7,
                      
                //         child: Container(
                //           child: Center(
                //             child: Text(
                //               'LOGIN',
                //               style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold,
                //                 fontFamily: 'Montserrat'
                //               ),
                //             )
                //           ),
                //         )
                //     ),
                //   ),
                // ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                      },
                      child: Text(
                        'Dont have an account? Register',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 60,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => P_SignupPage()));
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline
                        )
                      ),
                    )
                  ],
                ),


              ],
            ),
          ),
        ],
      ), 
      ),
    )
    );
  }
}

String? validateEmail(String? formEmail) {
  if(formEmail == null || formEmail.isEmpty){
    return 'E-mail address is required';
  }  
  String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern);
  if(!regex.hasMatch(formEmail)){
    return 'Invalid Email';
  }

  return null;
}

String? validatePassword(String? formPassword) {
  if(formPassword == null || formPassword.isEmpty){
    return 'Password is required';
  }
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if(!regex.hasMatch(formPassword)){
    return '''Password must be atleast 8 characters long, 
    include an uppercase letter, number and symbol''';
  }

  return null;
}
