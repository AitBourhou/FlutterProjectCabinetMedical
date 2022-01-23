import 'package:app_cabinet_medic/models/doctor_module.dart';

class AppointmentsUser
{

  List<dynamic> appointmentsUser;

  AppointmentsUser({this.appointmentsUser});
  factory AppointmentsUser.fromJson(Map<String,dynamic> jsonData)
  {
    return AppointmentsUser(

      appointmentsUser: jsonData['appointment'],
    );
  }
}