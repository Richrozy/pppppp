import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  late final Map<String, dynamic> userMap;
  late final String ChatScreenId;

  ChatScreen({
    Key? key,
    required this.ChatScreenId, 
    required this.userMap
  });

  final TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Name"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 1.25,
              width: size.width,
              child: StreamBuilder<QuerySnapshot>(
                builder: (BuildContext context, 
                AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasData != null) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data!.docs[index]['message']);
                      }
                    );
                  }
                  else{
                    return Container();
                  }
                },
              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height / 10,
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          height: size.height / 12,
          width: size.width / 1.1,
          child: Row(
            children: [
              Container(
                height: size.height / 12,
                width: size.width / 1.5,
                child: TextField(
                  controller: _message,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                ),
              ),
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.send)
              )
            ],
          ),
        ),
      ),
    );
  }
}