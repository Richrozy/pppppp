import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class viewDoctors extends StatefulWidget{
  @override
  _viewDoctorsState createState() => _viewDoctorsState();
}

class _viewDoctorsState extends State<viewDoctors> with WidgetsBindingObserver {
  final CollectionReference _referenceDoctorsList = FirebaseFirestore.instance.collection('Doctors');
  // late Stream<QuerySnapshot> _streamData;
  late Future<QuerySnapshot> _futureData;
  List<Map> _doctors = [];


  // String chatRoomId(String user1, String user2){
  //   if(user1[0].toLowerCase().codeUnits[0] > user2[0].toLowerCase().codeUnits[0]) {
  //     return "$user1$user2";
  //   }
  //   else{
  //     return "$user2$user1";
  //   }
  // }

  @override
  initState(){
    super.initState();
    _futureData = _referenceDoctorsList.get();
    _futureData.then((value) {
      setState(() {
        _doctors = parseData(value);
      });
    });
  }
  
  List<Map> parseData(QuerySnapshot querySnapshot){
    List<QueryDocumentSnapshot> listDocs = querySnapshot.docs;
    List<Map> listItems = listDocs.map((e) => {
      'First_name': e['firstname'],
      'Last_name': e['lastname'],
      'Speciality': e['speciality'],
      'age': e['age']
    }).toList();
    return listItems;
  }
 

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: const Text('Doctors'),
        backgroundColor: Color.fromARGB(255, 26, 23, 23),
      ),
      body: _doctors.isEmpty? 
      const Center(child: Text("No Doctors found!!!")): 
      buildListView(_doctors),
    );
  }
  
  ListView buildListView(List<Map<dynamic, dynamic>> doctors) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: ((context, index) {
        Map thisItem = doctors[index];
        
        return Container(
          decoration: BoxDecoration(      
            color: Color.fromARGB(255, 253, 195, 2),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text(thisItem['First_name']+" "+thisItem['Last_name'],
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Text(thisItem['Speciality']+", Age: "+thisItem['age'],
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              ),
            ], 
          ),
        );
      }),
    );
  }
}