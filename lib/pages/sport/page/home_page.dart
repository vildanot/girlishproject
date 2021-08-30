//import 'package:loginpage/mainfiles/sideBar.dart';
import 'package:loginpage/pages/sport/widget/exercises_widget.dart';
import 'package:loginpage/pages/sport/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';


class SportHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            buildAppBar(context),
            ExercisesWidget(),
          ],
        ),
      );

  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar( 
        flexibleSpace: FlexibleSpaceBar(background: LineChartWidget()),
        expandedHeight: MediaQuery.of(context).size.height * 0.5,
        stretch: true,
        title: Text('Exercise'),
        centerTitle: true,
        pinned: true,
        backgroundColor: Color(0xff74e9f8,
        
        
  ));
}
