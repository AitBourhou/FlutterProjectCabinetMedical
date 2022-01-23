import 'package:meta/meta.dart';
class Doctor {
  final int id;
  final String firstname;
  final String name;
  final String specialty;
  final String city;
  final String photo;
  final String univercity;
  final String phone;
  final String Description;
  final String address;


  Doctor({
    this.id,
    this.firstname,
    this.name,
    this.photo,
    this.phone,
    this.Description,
    this.address,
    this.specialty,
    this.city,
    this.univercity,

  });
  factory Doctor.fromJson(Map<String ,dynamic> jsonData)
  {
    return Doctor(
      id: jsonData['id'],
      firstname: jsonData['firstname'],
      name: jsonData['name'],
      photo: jsonData['photo'],
      specialty: jsonData['specialty'],
      univercity: jsonData['univercity'],
      city:  jsonData['city'],
      address:  jsonData['address'],
      Description:  jsonData['Description'],
      phone:  jsonData['phone'],

    );

  }
}
