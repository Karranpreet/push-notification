import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:login/welcome.dart';

import 'second.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
//   _HomeScreenState().selectNotification();
// }

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  getToken() async {
    String token = await _firebaseMessaging.getToken();
    print(token);
  }

  // Future selectNotification({String payload}) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text(message['notification']['title']),
                  content: Text(message['notification']['body']));
            });
        // print("onMessage: $message");
        //  _showItemDialog(message);
      },
     //onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async { // when app in kill state
       print("KILL APPP ????????????????????????????????????????????");
        print("onLaunch: $message");
     Navigator.push(context, MaterialPageRoute(builder: (context) => Second()));
      },
      onResume: (Map<String, dynamic> message) async { // when app in background and tap on notifi.
       print("BACKGROUNF APPP ????????????????????????????????????????????");
        print("onResume: $message");
       Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
      },
    );
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("karan"),
      ),
    );
  }
}
