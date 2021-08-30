import 'package:flutter/material.dart';

class RecommendedMealPlan extends StatelessWidget {

  final breakfast;
  final lunch;
  final dinner;
  RecommendedMealPlan({this.breakfast,this.lunch,this.dinner});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('Meal Recommedition'),
        //centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'Breakfast - $breakfast', style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'Lunch - $lunch', style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'Dinner - $dinner', style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
