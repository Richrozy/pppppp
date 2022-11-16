import 'package:flutter/material.dart';
import 'package:telemedicine/videocall/video_call.dart';
import 'package:get/get.dart';

class joinWithCode extends StatefulWidget {
  joinWithCode({Key? key}) : super(key: key);

  @override
  _joinWithCodeState createState() => _joinWithCodeState();
}

class _joinWithCodeState extends State<joinWithCode> {
  final TextEditingController _codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                child: Icon(Icons.arrow_back_ios_new_sharp, size: 35),
                onTap: Get.back,
              ),
            ),
            SizedBox(height: 50),
            Image.network(
              "A",
              fit: BoxFit.cover,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              "Enter Meeting Code Below",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Card(
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                ),
                child: TextField(
                  controller: _codeController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Example: abc-def-ghi"
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(VideoCall(channelName: _codeController.text.trim()));
              }, 
              child: Text("Join"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(50, 30),
                primary: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
            )
          ],
        ),
      )
    );
  }
}