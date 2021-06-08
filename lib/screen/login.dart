import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _email;
  String _password;

  Future<void> createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
      print("User: $userCredential");

    } on FirebaseAuthException catch (e){
      print(e);
    } catch (e) {
      print(e);
    }
  } 

  Future<void> loginUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      print("User: $userCredential");

    } on FirebaseAuthException catch (e){
      print(e);
    } catch (e) {
      print(e);
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue, 
        title: Text('Login'), 
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 70, 20, 40), 
        child: Column(
          children: [
            TextField(
              onChanged: (value){
                _email = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter Email'
              ),
            ),

            SizedBox(height: 40,),

            TextField(
              onChanged: (value){
                _password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter Password',
              ),
            ),

            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  child: Text('Sign up'), 
                  textColor: Colors.lightBlue, 
                  onPressed: createUser,
                ),
                MaterialButton(
                  child: Text('Login'), 
                  textColor: Colors.lightBlue, 
                  onPressed: loginUser
                ),
              ],
            )

            
          ],
        ),
      )
    );
  }
}