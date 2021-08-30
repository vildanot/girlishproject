import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/calculator/bmi_calculator/input_page.dart';
import 'package:loginpage/calculator/calorie_cal.dart';
import 'package:loginpage/calculator/meal_planner/mealPlanner.dart';
import 'package:loginpage/pages/calendar/calendar/calendar.dart';
import 'package:loginpage/mainfiles/HomePage.dart';
import 'package:loginpage/mainfiles/dashboard.dart';
import 'package:loginpage/pages/sport/page/home_page.dart';
import 'package:loginpage/pages/note/home.dart';
import 'package:loginpage/pages/todo2/main.dart';
import 'package:loginpage/pages/meditation/medi_mode.dart';

class MyDrawer extends StatelessWidget {
  FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        /*DrawerHeader(
          child: Text('Menu drawer'),
          decoration: BoxDecoration(
            color: Colors.green[50],
          ),
        ),*/
        SizedBox(height:30.0),
        CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                " Girlish Team",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "  Software Engenieer",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),),
        
        /*ListTile(
          leading: Icon(Icons.home, size: 40,),
          title: Text('First item'),
          subtitle: Text("This is the 1st item"),
          trailing: Icon(Icons.more_vert),
          onTap: () {
          },
        ),
        ListTile(
          title: Text('Second item'),
          onTap: () {
          },
        ),*/

        SizedBox(
        height: 20.0,
      ),
      //Now let's Add the button for the Menu
      //and let's copy that and modify it
      ListTile(
        onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context)=> ProfileHomePage()));},
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("Profile"),
      ),

      ListTile(
        onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context)=> Dash()));},
        leading: Icon(
          Icons.inbox,
          color: Colors.black,
        ),
        title: Text("Dashboard"),
      ),

      ListTile(
        onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context)=> DoHomeScreen()));},
        leading: Icon(
          Icons.toc_rounded,
          color: Colors.black,
        ),
        title: Text("To Do"),
      ),

      ListTile(
        onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context)=> TodoHome()));},
        leading: Icon(
          Icons.note_add_rounded,
          color: Colors.black,
        ),
        title: Text("Note"),
      ),
ListTile(
        onTap: () {
           Navigator.push(context,MaterialPageRoute(builder: (context)=> Calendar(user.toString())));
        },
        leading: Icon(
          Icons.calendar_today_rounded,
          color: Colors.black,
        ),
        title: Text("Calendar"),
      
      ),
      ListTile(
        onTap: () {
           Navigator.push(context,MaterialPageRoute(builder: (context)=> MedMode()));
        },
        leading: Icon(
          Icons.person_pin_circle_rounded,
          color: Colors.black,
        ),
        title: Text("Meditation"),
      ),

     

        ExpansionTile(
            leading: Icon(Icons.sports_handball),
            title: Text('Activities'),
    
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[
              ListTile(
                title: Text('Exercise'),
                trailing: Icon(Icons.sports_mma_rounded),
                onTap: () {
                   Navigator.push(context,MaterialPageRoute(builder: (context)=> SportHomePage()));
                },
              ),
              ListTile(
                title: Text('BMI Calculator'),
                trailing: Icon(Icons.calculate_rounded),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> BMIInputPage()));
                },
              ),
              ListTile(
                title: Text('Meal Planner'),
                trailing: Icon(Icons.next_plan_outlined),
                onTap: () {
                 Navigator.push(context,MaterialPageRoute(builder: (context)=> MealPlanner()));
                },
              ),
              ListTile(
                title: Text('Calorie Calculator'),
                trailing: Icon(Icons.calculate_rounded),
                onTap: () {
                   Navigator.push(context,MaterialPageRoute(builder: (context)=> FindCalorie()));
                },
              ),
            ],
          ),





      ],
    ),
  );
 }
  }


