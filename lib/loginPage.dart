import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homeScreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  final kTextFieldDecoration = InputDecoration(
      hintStyle: TextStyle(fontSize: 20, color: Colors.white),
      contentPadding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      filled: true,
      fillColor: Colors.white30,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide.none));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/backgroung.jpeg",
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Useremail",
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Forgot password ?",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    try {
                      UserCredential newUser =
                          await _auth.signInWithEmailAndPassword(email: email, password: password);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    } catch (e) {
                      print(e.message);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                      child: Text("Sign In"),
                    ),
                  ),
                ),
                // Expanded(
                //   child: Spacer(),
                // ),
                Text(
                  "Don't have account? Sign Up here",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
