import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

class Appointment {
  final int id;
  final int DocId;
  final int  PatId;
  final String dateApp ;
  final String heure ;

  /// final String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  final String state;


  Appointment({
    this.id,
    this.DocId,
    this.PatId,
    this.dateApp,
    this.state,
    this.heure,

  });
  factory Appointment.fromJson(Map<String ,dynamic> jsonData)
  {
    return Appointment(
      id: jsonData['id'],
      DocId: jsonData['Doc_id'],
      PatId: jsonData['Pat_id'],
      dateApp: jsonData['dateApp'],
      state:  jsonData['state'],
      heure:  jsonData['time'],

    );

  }
}
