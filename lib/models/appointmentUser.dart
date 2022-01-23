import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

class AppointmentUser {
  final int id;
  final int DocId;
  final int  PatId;
  final String dateApp ;
  /// final String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  final String state;
  final String firstname;
  final String specialty;
  final String heure;
  final String name;
  final String photo;


  AppointmentUser({
    this.id,
    this.DocId,
    this.photo,

    this.PatId,
    this.dateApp,
    this.state,
    this.firstname,
    this.name,
    this.specialty,
    this.heure,


  });
  factory AppointmentUser.fromJson(Map<String ,dynamic> jsonData)
  {
    return AppointmentUser(
      id: jsonData['id'],
      DocId: jsonData['Doc_id'],
      PatId: jsonData['Pat_id'],
      dateApp: jsonData['dateApp'],
      state:  jsonData['state'],
      firstname:  jsonData['firstname'],
      name:  jsonData['name'],
      specialty :jsonData['specialty'],
      heure: jsonData['time'],
      photo: jsonData['photo'],


    );

  }
}
