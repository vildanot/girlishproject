import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginpage/mainfiles/sideBar.dart';
class Description extends StatelessWidget {
  final String title, description;

  const Description({Key key, this.title, this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Description'),  backgroundColor: Color(0xffcf8cf9),),
      drawer: MyDrawer(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                title,
                style: GoogleFonts.roboto(
                    fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                description,
                style: GoogleFonts.roboto(fontSize: 20),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}