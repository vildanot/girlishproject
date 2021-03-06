import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loginpage/pages/calendar/Assignment.dart';
import 'package:loginpage/pages/calendar/FirestoreDB.dart';
import 'package:loginpage/pages/calendar/calendar_model.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

//import '../../main.dart';
import 'package:timezone/timezone.dart' as tz;

class Calendar extends StatefulWidget {
  final String uid;

  Calendar(this.uid);
  @override
  _CalendarState createState() => _CalendarState(uid);
}

class _CalendarState extends State<Calendar> {
  final String uid;
  _CalendarState(this.uid);
  DateTime _selectedDay = DateTime.now();
  FirestoreDB _db = new FirestoreDB();

  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events = {};
  List<CalendarItem> _data = [];
  List<Assignment> _dataAssignments = [];

  List<dynamic> _selectedEvents = [];
  List<Widget> get _eventWidgets => _selectedEvents.map((e) => events(e)).toList();

  void initState() {
    super.initState();
    //DB.init().then((value) => _fetchEvents());
    _fetchEvents();
    _calendarController = CalendarController();
  }

  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Widget events(var d) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
          width: MediaQuery.of(context).size.width * 1.9,
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          )),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(d, style: Theme.of(context).primaryTextTheme.bodyText1),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.trashAlt,
                  color: Colors.black,
                  size: 15,
                ),
                onPressed: () => _deleteEvent(d))
          ])),
    );
  }

  void _create(BuildContext context) {
    String _name = "";
    var content = TextField(
      style: GoogleFonts.montserrat(color: Color.fromRGBO(105, 105, 108, 1), fontSize: 16),
      autofocus: true,
      decoration: InputDecoration(
        labelStyle: GoogleFonts.montserrat(color: Color.fromRGBO(59, 57, 60, 1), fontSize: 18, fontWeight: FontWeight.normal),
        labelText: 'Enter Details',
      ),
      onChanged: (value) {
        _name = value;
      },
    );
    var btn = FlatButton(
      child: Text('Save', style: GoogleFonts.montserrat(color: Color.fromRGBO(59, 57, 60, 1), fontSize: 16, fontWeight: FontWeight.bold)),
      onPressed: () => _name == "" ? Navigator.of(context, rootNavigator: true).pop() : _addEvent(_name),
    );
    var cancelButton = FlatButton(
        child: Text('Cancel', style: GoogleFonts.montserrat(color: Color.fromRGBO(59, 57, 60, 1), fontSize: 16, fontWeight: FontWeight.bold)),
        onPressed: () => Navigator.of(context, rootNavigator: true).pop(false));
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text("Add Event", style: GoogleFonts.montserrat(color: Color.fromRGBO(59, 57, 60, 1), fontSize: 18, fontWeight: FontWeight.bold)),
                  Container(padding: EdgeInsets.all(20), child: content),
                  Row(mainAxisSize: MainAxisSize.min, children: <Widget>[btn, cancelButton]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchEvents() async {
    _events = {};
    /*List<Map<String, dynamic>> _results = await DB.query(CalendarItem.table);
    _data = _results.map((item) => CalendarItem.fromMapAlternative(item)).toList();*/
    _data = await _db.getCalendar(uid);
    _dataAssignments = await _db.getAssignments(uid);
    if (_data != null) {
      _data.forEach((element) {
        DateTime formattedDate = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.parse(element.date.toString())));
        if (_events.containsKey(formattedDate)) {
          _events[formattedDate].add(element.name.toString());
        } else {
          _events[formattedDate] = [element.name.toString()];
        }
      });
    }
    if (_dataAssignments != null) {
      _dataAssignments.forEach((element) {
        DateTime formattedDate = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.parse(element.date.toString())));
        if (_events.containsKey(formattedDate)) {
          _events[formattedDate].add(element.title.toString());
        } else {
          _events[formattedDate] = ["Assignment - " + element.title.toString()];
        }
      });
    }
    setState(() {});
  }

  void _addEvent(String event) async {
    CalendarItem item = CalendarItem(date: _selectedDay.toString(), name: event);

    //await DB.insert(CalendarItem.table, item);
    await _db.addCalendar(item, uid);
    _selectedEvents.add(event);
    _fetchEvents();
    var rand = new Random();
    //scheduleAlarm(item.name, DateFormat('EEEE').format(_selectedDay), rand.nextInt(50000));
    Navigator.of(context, rootNavigator: true).pop();
    //Navigator.pop(context);
  }

  void _deleteEvent(String s) {
    List<CalendarItem> d = _data.where((element) => element.name == s).toList();
    if (d.length == 1) {
      //DB.delete(CalendarItem.table, d[0]);
      _db.deleteCalendar(d[0], uid);
      _selectedEvents.removeWhere((e) => e == s);
      _fetchEvents();
    }
  }

  void _onDaySelected(DateTime day, List events, _) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  Widget calendar() {
    var tableCalendar = TableCalendar(
      calendarStyle: CalendarStyle(
        canEventMarkersOverflow: true,
        markersColor: Colors.white,
        weekdayStyle: TextStyle(color: Colors.deepPurple),
        todayColor: Colors.orange,
        todayStyle: TextStyle(color: Colors.blue[900], fontSize: 15, fontWeight: FontWeight.bold),
        selectedColor: Colors.blue[900],
        outsideWeekendStyle: TextStyle(color: Colors.deepPurpleAccent),
        outsideStyle: TextStyle(color: Colors.deepPurple),
        weekendStyle: TextStyle(color: Colors.deepPurpleAccent[300]),
        //renderDaysOfWeek: false,
      ),
      onDaySelected: (date, events) {
                setState(() {
                  
                  _selectedEvents = events;
                });
              },
      calendarController: _calendarController,
      events: _events,
      headerStyle: HeaderStyle(
        leftChevronIcon: Icon(Icons.arrow_back_ios, size: 15, color: Colors.black),
        rightChevronIcon: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.black),
        titleTextStyle: GoogleFonts.montserrat(color: Colors.pink, fontSize: 16),
        formatButtonDecoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(20),
        ),
        formatButtonTextStyle: GoogleFonts.montserrat(color: Colors.blue[900], fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(6),
            
            boxShadow: <BoxShadow>[BoxShadow(color: Colors.black12, blurRadius: 5, offset: new Offset(0.0, 5))]),
        child: tableCalendar);
  }

  Widget eventTitle() {
    if (_selectedEvents.length == 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
        child: Text("No events", style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold)),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Text("Events", style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Calendar"),
      backgroundColor: Colors.blueAccent),
      backgroundColor: Colors.blueAccent[100],
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          calendar(),
          eventTitle(),
          Column(children: _eventWidgets),
          SizedBox(height: 60)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: Colors.teal[200],
        onPressed: () => _create(context),
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

 /* void scheduleAlarm(String title, String day, int id) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        'Today is $title',
        '',
        _nextInstanceOfMondayTenAM(day),
        const NotificationDetails(
            android: AndroidNotificationDetails('full screen channel id', 'full screen channel name', 'full screen channel description',
                priority: Priority.high, importance: Importance.high, fullScreenIntent: true)),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }*/

  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  tz.TZDateTime _nextInstanceOfMondayTenAM(String day) {
    tz.TZDateTime scheduledDate = _nextInstanceOfTenAM();
    var dateTimeDay = DateTime.monday;
    if (day == "Monday")
      dateTimeDay = DateTime.monday;
    else if (day == "Tuesday")
      dateTimeDay = DateTime.tuesday;
    else if (day == "Wednesday")
      dateTimeDay = DateTime.wednesday;
    else if (day == "Thursday")
      dateTimeDay = DateTime.thursday;
    else if (day == "Friday")
      dateTimeDay = DateTime.friday;
    else if (day == "Saturday")
      dateTimeDay = DateTime.saturday;
    else if (day == "Sunday") dateTimeDay = DateTime.sunday;

    while (scheduledDate.weekday != dateTimeDay) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
