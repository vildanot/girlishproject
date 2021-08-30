import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:loginpage/mainfiles/Start.dart';


class ProfileHomePage extends StatefulWidget {
  @override
  _ProfileHomePageState createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseUser user;
  bool isloggedin= false;


  /*checkAuthentification() async{

    _auth.onAuthStateChanged.listen((user) { 

      if(user ==null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Start()));
      }
    });
  }*/

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
    ///this.checkAuthentification();
    this.getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Profile Settings"),
        backgroundColor: Colors.purple[400],
      ),


     body: Container(
       child: !isloggedin? CircularProgressIndicator(): 
       
       Column(
         children: <Widget>[

           SizedBox(height: 40.0),

           Container(

            height: 300,
            child: Image(image: AssetImage("assets/images/logo5k.png"),
            fit: BoxFit.contain,
          ),
        ),     
            Container(
              child: Text("Hello ${user.displayName} you are logged in as \n ${user.email}",  textAlign: TextAlign.center ,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height:30.0),

            RaisedButton(

               padding: EdgeInsets.fromLTRB(70,10,70,10),
                      onPressed: signOut,
                      child: Text('Signout',style: TextStyle(

                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                      
                      )),

                      color: Colors.purple,
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(20.0),
                      ),
            )
        ],
       ),
     )

    );
  }
}