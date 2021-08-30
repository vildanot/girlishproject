import 'package:flutter/material.dart';
import 'package:loginpage/mainfiles/dashboard.dart';
import '../services/userManagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginpage/mainfiles/Start.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;
  String _name;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white24,
            leading: new IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black,),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> Start()));
                }
            )
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(
                      child: Text('Create an account',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Column(
                    children: <Widget>[
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              icon: Icon(
                          Icons.email,
                         color: Colors.black,
                          ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple))),
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          }
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'PASSWORD ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                                  icon: Icon(
                      Icons.lock,
                      color: Colors.black,
                   ),
                   suffixIcon: Icon(
                  Icons.visibility,
                  color: Colors.grey,
                  ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple))),
                          obscureText: true,
                          onChanged: (value) {
                            
                            setState(() {
                              
                              _password = value;
                            });
                          }
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'NAME',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                                  icon: Icon(
                          Icons.contact_page,
                         color: Colors.black,
                          ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple))),
                          onChanged: (value) {
                            setState(() {
                              _name = value;
                            });
                          }
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        width: 270,
                        height: 40,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.deepPurple,
                        ),
                        child: OutlineButton(
                          child: Center(
                              child: Text('Sign Up',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  )
                              )
                          ),
                          onPressed: () {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: _email, password: _password)
                                  .then((signedInUser) {
                                
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> Dash()));
                              
                                FirebaseAuth.instance.currentUser().then((val) {
                                  UserUpdateInfo updateUser = UserUpdateInfo();
                                  updateUser.displayName = _name;
                                  
                                  updateUser.photoUrl =
                                  'https://i.stack.imgur.com/34AD2.jpg';
                                  val.updateProfile(updateUser)
                                      .then((user) {
                                    FirebaseAuth.instance
                                        .currentUser()
                                        .then((user) {
                                      UserManagement()
                                          .storeNewUser(user, context);
                                      UserManagement.updateFirstName(_name);
                                    }).catchError((e) {
                                      print(e);
                                    });
                                  }).catchError((e) {
                                    print(e);
                                  });
                                }).catchError((e) {
                                  print(e);
                                });
                              });
                            },
                        ),
                      ),
                    ]
                )
            ),
            
            
          ],
        )
    );
  }
}