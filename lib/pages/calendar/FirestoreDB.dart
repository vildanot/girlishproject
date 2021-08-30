import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'Assignment.dart';
import 'package:loginpage/pages/calendar/calendar_model.dart';

class FirestoreDB extends ChangeNotifier {
  final CollectionReference _usersCollectionReference = Firestore.instance.collection('users');

  

  Future getCalendar(String uid) async {
    try {
      var notesDocumentSnapshot = await _usersCollectionReference.document(uid).collection('callendar').getDocuments();
      if (notesDocumentSnapshot.documents.isNotEmpty) {
        return notesDocumentSnapshot.documents.map((snapshot) => CalendarItem.fromMap(snapshot.data, snapshot.documentID)).toList();
      }
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  Future addCalendar(CalendarItem event, String uid) async {
    try {
      await _usersCollectionReference.document(uid).collection('callendar').add(event.toMap());
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  Future deleteCalendar(CalendarItem event, String uid) async {
    await _usersCollectionReference.document(uid).collection('callendar').document(event.id).delete();
  }

  Future getAssignments(String uid) async {
    try {
      var assignmentsDocumentSnapshot = await _usersCollectionReference.document(uid).collection('assignments').getDocuments();
      if (assignmentsDocumentSnapshot.documents.isNotEmpty) {
        return assignmentsDocumentSnapshot.documents.map((snapshot) => Assignment.fromMap(snapshot.data, snapshot.documentID)).toList();
      }
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  Future addAsignment(Assignment assignment, String uid) async {
    try {
      await _usersCollectionReference.document(uid).collection('assignments').add(assignment.toMap());
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  Future deleteAssignment(Assignment assignment, String uid) async {
    await _usersCollectionReference.document(uid).collection('assignments').document(assignment.id).delete();
  }

  
}
