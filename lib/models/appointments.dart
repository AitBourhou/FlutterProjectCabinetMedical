import 'package:app_cabinet_medic/models/doctor_module.dart';

class Appointments
{

  List<dynamic> appointments;

  Appointments({this.appointments});
  factory Appointments.fromJson(Map<String,dynamic> jsonData)
  {
    return Appointments(

      appointments: jsonData['appointment'],
    );
  }
}