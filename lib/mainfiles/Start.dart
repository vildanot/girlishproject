import 'package:flutter/material.dart';
import 'package:loginpage/mainfiles/loginPage.dart';
import 'package:loginpage/mainfiles/signupPage.dart';
//import 'SignUp.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  navigateToLogin()async{

    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  }

   navigateToRegister()async{

    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/bg.png"),
        fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[

            SizedBox(height: 80.0),

            Container(
              height: 300,
              width: 350,

              child:Image(image: AssetImage("assets/images/logo5k.png"),
              fit: BoxFit.contain,
              ),
            ),

            SizedBox(height : 40),

            RichText(
              
              text: TextSpan(
                text: 'Welcome to ', style: TextStyle(
                 fontSize: 25.0,
                 fontWeight: FontWeight.bold,
                 color: Colors.black
                ),

                children: <TextSpan>[
                  TextSpan(
                    text: 'Girlish', style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.purple)
                  )
                ]
              ) 
            ),
            SizedBox(height: 10.0),

            Text('More than Agenda',style: TextStyle(color:Colors.black),),

            SizedBox(height: 40.0),


            Row( mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                RaisedButton(
                  padding: EdgeInsets.only(left:30,right:30),
                  
                  onPressed: navigateToLogin,
                  child: Text('LOGIN',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.purple
                ),

                SizedBox(width:20.0),

                RaisedButton(
                  padding: EdgeInsets.only(left:30,right:30),
                  
                  onPressed: navigateToRegister,
                  child: Text('REGISTER',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.purple
                ),

              ],
            ),

            
                SizedBox(height : 20.0),

                /*SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {},
             ),*/
             
             SizedBox(height: 20.0),
               /*Container(
                 height: 120,
                 width: 180,
                child: Image(image: AssetImage("assets/images/logo5k.png"),
                fit: BoxFit.contain,
             
              ),
            ),*/
          ],
        ),
      ),
      
    );
  }
}