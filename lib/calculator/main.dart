import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/calculator/calorie_cal.dart';
import 'package:loginpage/calculator/meal_planner/mealPlanner.dart';
import 'package:loginpage/calculator/bmi_calculator/input_page.dart';
import 'package:loginpage/mainfiles/sideBar.dart';
import 'package:loginpage/pages/meditation/widgets.dart';
import 'package:loginpage/pages/sport/page/home_page.dart';




class ActivitiesHomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return Meditation();
  }
}

class Meditation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
    
    backgroundColor:Color(0xffcf8cf9), 
   
     
     ),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              //fontFamily: "Josefin",
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            PromoIcons(assetName: "assets/images/moon.png"),
                            PromoIcons(assetName: "assets/images/circle.png"),
                            PromoIcons(assetName: "assets/images/triangle.png"),
                            PromoIcons(assetName: "assets/images/drop.png"),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Stay Healthy...",
                                style: TextStyle(
                                  //fontFamily: "Josefin",
                                  fontSize: 20,
                                ),
                              ),
                              //Text("~")
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Modes(
                              background: Color(0xffffb773),
                              flexSize: 4,
                              mgTop: 30,
                              mgLeft: 30,
                              mgRight: 10,
                              mgBottom: 10,
                              modeName: "Calculate Calorie ",
                              assetImage: "assets/images/coltri.png",
                              buttonAsset: "assets/images/triangle.png",
                              openMode: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => FindCalorie())),
                            ),
                            Modes(
                              background: Color(0xffcf8cf9),
                              flexSize: 6,
                              mgTop: 10,
                              mgLeft: 30,
                              mgRight: 10,
                              mgBottom: 30,
                              modeName: "Meal\n Planner",
                              assetImage: "assets/images/colmoon.png",
                              buttonAsset: "assets/images/moon.png",
                              openMode: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => MealPlanner())),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: [
                            Modes(
                                background: Color(0xff74e9f8),
                                flexSize: 6,
                                mgTop: 30,
                                mgLeft: 10,
                                mgRight: 30,
                                mgBottom: 10,
                                modeName: "Exercise\nRoutine",
                                assetImage: "assets/images/colcir.png",
                                buttonAsset: "assets/images/circle.png",
                                openMode: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => SportHomePage()))
                                ),
                            Modes(
                              background: Color(0xff97e37b),
                              flexSize: 4,
                              mgTop: 10,
                              mgLeft: 10,
                              mgRight: 30,
                              mgBottom: 30,
                              modeName: "BMI Calculator",
                              assetImage: "assets/images/coldrop.png",
                              buttonAsset: "assets/images/drop.png",
                              openMode: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => BMIInputPage()))
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
