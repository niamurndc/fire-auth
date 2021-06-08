import 'package:fireauth/screen/home.dart';
import 'package:fireauth/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {

  final Future<FirebaseApp> _init = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init, 
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Scaffold(
            backgroundColor: Colors.lightBlue,
            body: Center(
              child: Text("Error: Has some error"),
            ),
          );
        }

        if(snapshot.connectionState == ConnectionState.done){
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.active){
                User user = snapshot.data;

                if(user == null){
                  return Login();
                }else{
                  return Home();
                }
              }

              return Scaffold(
                body: Center(
                    child: Text("Loading"),
                  ),
              );
            },
          );
        }

        return Scaffold(
          body: Center(
              child: Text("Loading"),
            ),
        );
      },
    );
  }
}