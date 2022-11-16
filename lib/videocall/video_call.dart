import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:http/http.dart';


class VideoCall extends StatefulWidget {

  String channelName = "Telemed";

  VideoCall({required this.channelName});
  
  @override
  State<VideoCall> createState() => _VideoCallState();
}


class _VideoCallState extends State<VideoCall> {

  late final AgoraClient _client;
  bool isLoading = true;
  String Token = "";

  @override
  void initState(){
    getToken();
    super.initState();
  }

  Future<void> getToken() async{
    String link = "";
    Response _response = await get(Uri.parse(link));
    Map data = jsonDecode(_response.body);

    setState(() {
      Token = data["token"];
    });

    _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "fa3ebd1e9f854c9c8a60430b5fe4d64c",
      tempToken: Token,
      channelName: widget.channelName,
    ),
    enabledPermission: [Permission.camera, Permission.microphone]
  );
  Future.delayed(Duration(seconds: 1)).then((value) => setState(() => isLoading = false),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading? Center(child: CircularProgressIndicator(),)
        : Stack(
          children: [
            AgoraVideoViewer(
              client: _client
            ),
            AgoraVideoButtons(
              client: _client
            )
          ],
        )
      ),
    );
  }
}