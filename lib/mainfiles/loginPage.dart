import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginpage/mainfiles/Start.dart';
import 'package:loginpage/mainfiles/dashboard.dart';
import 'signupPage.dart';
import 'package:loginpage/services/signInManagement.dart';
import 'package:loginpage/services/resetpass.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignupPage()
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;


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
                  SizedBox(height: 5.0),
                  Container(
                    //padding: EdgeInsets.only(top: 5),
                    child: Center(
                      child: Text('SIGN IN  ',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
                height: 150, width: 400,
                child: Image(image: AssetImage("assets/images/login.png"),
                fit: BoxFit.contain,
                ),
              ),
            SizedBox(height: 5.0),
            Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
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
                        },
                      ),

                      SizedBox(height: 5.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
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
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        height: 40.0,
                        //width: 300.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          elevation: 20,
                          child: OutlineButton(
                            child: Center(
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            onPressed: () {
                              
                                   {
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> ResetScreen()));
                              }
                                  
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        height: 40.0,
                        width: 300.0,
                    
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepPurple,
                          elevation: 20,
                          child: OutlineButton(
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            onPressed: () {
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: _email,
                                  password: _password
                              )
                                  .then((FirebaseAuth) {
                                Navigator.push(context,MaterialPageRoute(builder: (context)=> Dash()));
                              })
                                  .catchError((e) {
                                print(e);
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height:20.0),
                      /*Container(
                                      padding: EdgeInsets.only(left: 20, right: 20),
                                      child: Container(
                                          width: 180,
                                          height: 50,
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                10.0),
                                            color: Color.fromRGBO(
                                                81, 113, 100, 0.2),
                                          ),
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 7, bottom: 7),
                                              child: OutlineButton( 
                                                borderSide: BorderSide.none,
                                                child: Center( 
                                                  child: new Image.asset(
                                                    'assets/images/googleIcon.png',),
                                                ),
                                                
                                                onPressed: () {
                                                  SignIn.signInWithGoogle(context);
                                                Navigator.push(context,MaterialPageRoute(builder: (context)=> HomePage()));
                                            })

                                          )
                                      )
                                  ),*/
                                  Container(
                  width: 250.0,
                    child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Color(0xffffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                      Icon(FontAwesomeIcons.solidEnvelope,color: Colors.blue[900],),
                      SizedBox(width:10.0),
                      Text(
                      'Sign in with Google',
                      style: TextStyle(color: Colors.black,fontSize: 18.0),
                    ),
                    ],),
                    onPressed: () {SignIn.signInWithGoogle(context);
                                                Navigator.push(context,MaterialPageRoute(builder: (context)=> Dash()));},
                  ),
                )
                ),
                                  

                                  //SizedBox(height: 20.0),
                      

                      
                    ]
                )

            )
          ],
        ));
  }
}

