import 'package:loginpage/pages/sport/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


}

class MyApp extends StatelessWidget {
  static final String title = 'Fitness App UI';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Color(0xFFff6369),
        ),
        home: SportHomePage(),
      );
}
