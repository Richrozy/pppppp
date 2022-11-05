import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:telemedicine/admin/login.dart';
import 'package:telemedicine/main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget{
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return new Scaffold(
      appBar: AppBar(
        title: Text("TeleMed",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Form(
        key: _key,
      child: new SingleChildScrollView(
        child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 55, 0, 0),
                  child: Text('REGISTER',
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
                  controller: _fnameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
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
                  controller: _lnameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
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
                SizedBox(height: 60,),
                
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      errorMessage
                    ),
                  ),
                ),
                
                Container(
                  height: 50, 
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.greenAccent,
                    color: Colors.black,
                    elevation: 7,
                    child: GestureDetector(
                      onTap: 
                      user != null ? null:
                      () async{
                        final isValid = _key.currentState!.validate();
                        if(!isValid) return;
                        showDialog(
                          context: context, 
                          builder: (context) => const Center(child: CircularProgressIndicator()),
                        );
                        try{
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                          errorMessage = '';
                        }
                        on FirebaseAuthException catch (error){
                          errorMessage = error.message!;
                        }
                          
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage(title: 'Telemedicine'))));
                          });
                        
                      },
                      child: Center(
                        child: Text(
                          'SIGNUP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'
                          ),
                        )
                      )
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        FirebaseAuth.instance.signOut().then((value){
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => MyApp())));
                        });
                      },
                      child: Text(
                        'Already have an account? Login',
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
