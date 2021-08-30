/// lib/presentation/search/pages/search_page.dart
import 'package:flutter/material.dart';
//import 'package:loginpage/mainfiles/sideBar.dart';

//import 'package:loginpage/services/signInManagement.dart';
//import 'package:loginpage/services/userManagement.dart';

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:loginpage/denemee/theme.dart';
import 'package:loginpage/pages/calendar/calendar/calendar.dart';
//import 'package:provider/provider.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalendarPage extends StatelessWidget {
  final String uid;

  CalendarPage(String string, {Key key,  @required this.uid}) : super(key: key);

 /* static const routeName = '/home';
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => CalendarPage(),
      );*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),

        /*actions: <Widget>[
          Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => IconButton(
                  icon: notifier.isDarkTheme
                      ? FaIcon(
                          FontAwesomeIcons.moon,
                          size: 20,
                          color: Colors.pink,
                        )
                      : Icon(Icons.wb_sunny),
                  onPressed: () => {notifier.toggleTheme()})),
          
        ],*/
             ),
      body: Center(
        child: Calendar(uid),
      ),
    );
  }
}
