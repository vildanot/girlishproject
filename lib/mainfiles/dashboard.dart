import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginpage/calculator/main.dart';
import 'package:loginpage/pages/calendar/calendar/calendar.dart';
import 'package:loginpage/mainfiles/Start.dart';
import 'package:loginpage/pages/meditation/medi_mode.dart';
import 'package:loginpage/pages/note/home.dart';
import 'package:loginpage/pages/todo2/main.dart';
import 'sideBar.dart';
import 'package:loginpage/mainfiles/sideBar.dart';
import 'package:loginpage/mainfiles/HomePage.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}
 
class _DashState extends State<Dash> {
   final FirebaseAuth _auth = FirebaseAuth.instance;
  //final GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseUser user;
  bool isloggedin= false;

  checkAuthentification() async{

    _auth.onAuthStateChanged.listen((user) { 

      if(user ==null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Start()));
      }
    });
  }

  getUser() async{

    FirebaseUser firebaseUser = await _auth.currentUser();
    //await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser();

    if(firebaseUser !=null)
    {
      setState(() {
        this.user =firebaseUser;
        this.isloggedin=true;
      });
    }
  }

  signOut()async{

    _auth.signOut();
  }

  @override
  void initState(){
  super.initState();
    this.checkAuthentification();
    this.getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
     drawer: MyDrawer(),
      body: Container(
        

        width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.fill,
          ),
        ),
        child: !isloggedin? CircularProgressIndicator(): 
         Column(
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Icon(Icons.menu_sharp, color: Colors.white,size: 52.0,),
                  Image.asset("assets/images/logo5k.png",width: 90.0,),
                  //Image.asset("assets/images/image.png",width: 52.0,),
                  
                ],
               
              ),
            ),
           
            
           /* Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Welcome ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Wrap(
                  spacing:20,
                  runSpacing: 20.0,
                  children: <Widget>[
                    SizedBox(
                      width:160.0,
                      height: 150.0,
                      child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> DoHomeScreen()));
        },
                      child: Card(

                        color: Color.fromRGBO(255,244,243, 0.7),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child:Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                            children: <Widget>[
                              Image.asset("assets/images/todo.png",width: 64.0,),
                              
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Todo List",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                                ),
                              ),
                              /*SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "2 Items",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100
                                ),
                              )*/
                            ],
                            ),
                          )
                        ),
                      ),
                    )),
                    SizedBox(
                      width:160.0,
                      height: 150.0,
                      
                      child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> TodoHome()));
        },
                      
                      child: Card(
                        color: Color.fromRGBO(255,244,243, 0.7),

                        //color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/note.png",width: 64.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Notes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  /*SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "12 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )*/
                                ],
                              ),
                            )
                        ),
                      ),),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 150.0,

                      child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> Calendar(user.toString())));
        },



                      child: Card(
                        color: Color.fromRGBO(255,244,243, 0.7),

                        //color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/calendar.png",width: 64.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Calendar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  /*SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "4 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )*/
                                ],
                              ),
                            )
                        ),
                      )),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 150.0,

                      
                      child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> ActivitiesHomePage()));
        },

                      child: Card(
                        color: Color.fromRGBO(255,244,243, 0.7),

                        //color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/gym.png",width: 64.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Activities",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  /*SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "6 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )*/
                                ],
                              ),
                            )
                        ),
                      )),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 150.0,

                       child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> MedMode()));
        },
                      child: Card(
                        color: Color.fromRGBO(255,244,243, 0.7),

                        //color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/yoga2.png",width: 64.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Motivation",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  /*SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "6 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  )*/
                                ],
                              ),
                            )
                        ),
                      ),),
                    ),
                    SizedBox(
                      width:160.0,
                      height: 150.0,
                      child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> ProfileHomePage()));
        },
                      child: Card(
                        color: Color.fromRGBO(255,244,243, 0.7),

                        //color: Color.fromARGB(255,21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child:Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/images/settings.png",width: 64.0,),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Settings",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0
                                    ),
                                  ),
                                  /*SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "6 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100
                                    ),
                                  ),*/
                                  
                                  
                                ],
                              ),
                            )
                        ),
                      ),
                    )),
                    SizedBox(height:10.0,
                ),
                   /* RaisedButton(
                                    

                      padding: EdgeInsets.only(left: 130, right: 130),
                      
                      onPressed: signOut,
                      child: Text('Signout',style: TextStyle(

                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                      
                      )),

                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        

                        borderRadius: BorderRadius.circular(20.0),
                      ),
            ),*/

                  ],
                ),
              ),
            )
          ],
      ),

      
    ));
  }
}