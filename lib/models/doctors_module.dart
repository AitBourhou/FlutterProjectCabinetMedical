import 'package:app_cabinet_medic/models/doctor_module.dart';

class Doctors
{

  List<dynamic> doctors;

  Doctors({this.doctors});
  factory Doctors.fromJson(Map<String,dynamic> jsonData)
  {
    return Doctors(

      doctors: jsonData['doctor'],
    );
  }
}