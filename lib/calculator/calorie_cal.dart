import 'package:flutter/material.dart';



class FindCalorie extends StatefulWidget {
  FindCalorie({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FindCalorieState createState() => _FindCalorieState();
}

class _FindCalorieState extends State<FindCalorie> {
  double weight;
  int calorieBase;
  int calorieActivity;
  bool gender = false;
  double age;
  double height = 170.0;
  int radioSelection;
  Map mapActivite = {
    0: "Low",
    1: "Moderate",
    2: "Active"
  };

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
        child: new Scaffold(
          appBar: AppBar(
           // title: Text(widget.title),
            backgroundColor: setColor(),
          ),
          body: Center(
            child: new SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  padding(),
                  textStyle("Fill in all the fields to get your daily calorie requirement", fontSize: 18.0),
                  padding(),
                  new Card(
                    elevation: 10.0,
                    child: new Column(
                      children: <Widget>[
                        padding(),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            textStyle("Women", color: Colors.deepOrange, fontSize: 18.0),
                            new Switch(
                                value: gender,
                                inactiveTrackColor: Colors.deepOrange,
                                activeTrackColor: Colors.blue,
                                onChanged: (bool b) {
                                  setState(() {
                                    gender = b;
                                  });
                                }),
                            textStyle("Man", color: Colors.lightBlue[800], fontSize: 18.0)
                          ],
                        ),
                        padding(),
                        new RaisedButton(
                          onPressed: () => montrerPicker(),
                          color: setColor(),
                          child: textStyle(
                            age == null ? "Press to enter your age " : "Your age is : ${age.toInt()} ans",
                            color: Colors.white, fontSize: 18.0),

                        ),
                        padding(),
                        textStyle("Your height is : ${height.toInt()} cm.", color: setColor(), fontSize: 16.0),
                        padding(),
                        new Slider(
                            value: height,
                            min: 100.0,
                            max: 215.0,
                            activeColor: setColor(),
                            onChanged: (double d) {
                              setState(() {
                                height = d;
                              });
                            }),
                        padding(),
                        new TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (String str) {
                            setState(() {
                              weight = double.tryParse(str);
                            });
                          }, 
                          decoration: new InputDecoration(
                              labelText: "     Enter your weight in Kilos",
                          ),
                        ),
                        padding(),
                        textStyle("What is your sport activity ?", color: setColor()),
                        padding(),
                        rowRadio()
                      ],
                    ),
                  ),
                  padding(),
                  new RaisedButton(
                      color: setColor(),
                      child: textStyle("Calculate", color: Colors.white),
                      onPressed: calculateCalories)
                ],
              ),
            ),
          ),
        )
    );
  }

  Row rowRadio() {
    List<Widget> l = [];
    mapActivite.forEach((key, value) {
      Column colonne = new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Radio(
              value: key,
              activeColor: setColor(),
              groupValue: radioSelection,
              onChanged: (Object i) {
                setState(() {
                  radioSelection = i;
                });
              }),
          textStyle(value, color: setColor())
        ],
      );
      l.add(colonne);
    });
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: l,
    );
  }

  Padding padding() {
    return new Padding(padding: EdgeInsets.only(top: 20));
  }

  Future<Null> montrerPicker() async{
    DateTime choix = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now(),
        initialDatePickerMode: DatePickerMode.year
    );
    if (choix != null) {
      Duration difference = new DateTime.now().difference(choix);
      int jours = difference.inDays;
      setState(() {
        age = jours / 365;
      });
    }
  }

  Color setColor() {
    return gender ? Colors.lightBlue[900] : Colors.deepOrange[400];
  }

  Text textStyle(String data, {color: Colors.black, fontSize: 15.0}) {
    return new Text(
      data,
      textAlign: TextAlign.center,
      style: new TextStyle(
          color: color,
          fontSize: fontSize),
    );
  }

  void calculateCalories() {
    if (age != null && weight != null && radioSelection != null) {
      if (gender)
        calorieBase = (66.4730 + (13.7516 * weight) + (5.0033 * height) - (6.7550 * age)).toInt();
      else
        calorieBase = (655.0955 + (9.5634 * weight) + (1.8496 * height) - (4.6756 * age)).toInt();
      switch(radioSelection) {
        case 0:
          calorieActivity = (calorieBase * 1.2).toInt();
          break;
        case 1:
          calorieActivity = (calorieBase * 1.5).toInt();
          break;
        case 2:
          calorieActivity = (calorieBase * 1.8).toInt();
          break;
        default:
          calorieActivity = calorieBase;
          break;
      }
      setState(() {
        dialogue();
      });
    } else{
      alerte();
    }
  }

  Future<Null> dialogue() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext bc) {
          return SimpleDialog(
            title: textStyle("Your calorie requirement", color: setColor()),
            children: <Widget>[
              padding(),
              textStyle("Your basic need is to: ${calorieBase}"),
              padding(),
              textStyle("Your need with activity is : $calorieActivity"),
              padding(),
              new RaisedButton(
                  color: setColor(),
                  child: textStyle('OK', color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        }
    );
  }

  Future<Null> alerte() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return new AlertDialog(
            title: textStyle("Error"),
            content: textStyle("All fields are not filled"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: textStyle("OK", color: Colors.red)
              )
            ],
          );
        }
    );
  }
}