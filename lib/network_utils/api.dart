
import 'dart:convert';
import 'package:app_cabinet_medic/models/appointment.dart';
import 'package:app_cabinet_medic/models/appointments.dart';
import 'package:app_cabinet_medic/models/categorie.dart';
import 'package:app_cabinet_medic/models/categories.dart';
import 'package:app_cabinet_medic/models/doctors_module.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_cabinet_medic/models/doctor_module.dart';
import 'package:app_cabinet_medic/models/appointmentUser.dart';
import 'package:app_cabinet_medic/models/appointmentsUser.dart';

class Network{
  final String _url = 'http://192.168.43.116/api/v1';



  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }


  authData(data, apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl);
    return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders()


    );
  }
   makeAppointment(int id)
  async {
    String myUrl = "http://192.168.43.116/api/v1/appointment/$id";
    await _getToken();
    return await http.post(myUrl,
        headers: _setHeaders());

  }
  activeButtonMake(int id)
  async {
    String myUrl = "http://192.168.43.116/api/v1/activeButtonMake/$id";
    await _getToken();
    return await http.get(myUrl,
        headers: _setHeaders());

  }
  ButtonAccept(int id)
  async {
    String myUrl = "http://192.168.43.116/api/v1/ButtonAccept/$id";
    await _getToken();
    return await http.post(myUrl,
        headers: _setHeaders());

  }
  ButtonRefuse(int id)
  async {
    String myUrl = "http://192.168.43.116/api/v1/ButtonRefuse/$id";
    await _getToken();
    return await http.post(myUrl,
        headers: _setHeaders());

  }
  ButtonAnnule(int id)
  async {
    String myUrl = "http://192.168.43.116/api/v1/ButtonAnnule/$id";
    await _getToken();
    return await http.post(myUrl,
        headers: _setHeaders());

  }

  ///function check proposition
  Future<List<Appointment>> checkPropo(int id ) async{
    String myUrl = "http://192.168.43.116/api/v1/checkProposition/$id";
    await _getToken();
    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    Appointments appointments= Appointments.fromJson(jsonData);
    List<Appointment> appointmentsList = appointments.appointments.map((e) => Appointment.fromJson(e)).toList();
    return appointmentsList ;
  }
  ///function check demandes appointment
  Future<List<Appointment>> checkRequest(int id ) async{
    String myUrl = "http://192.168.43.116/api/v1/checkRequest/$id";
    await _getToken();
    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    Appointments appointments= Appointments.fromJson(jsonData);
    List<Appointment> appointmentsList = appointments.appointments.map((e) => Appointment.fromJson(e)).toList();
    return appointmentsList ;
  }
  ///function check Refuse appointment
  Future<List<Appointment>> checkRefuse(int id ) async{
    String myUrl = "http://192.168.43.116/api/v1/checkRefuse/$id";
    await _getToken();
    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    Appointments appointments= Appointments.fromJson(jsonData);
    List<Appointment> appointmentsList = appointments.appointments.map((e) => Appointment.fromJson(e)).toList();
    return appointmentsList ;
  }
  ///function check accept appointment
  Future<List<Appointment>> checkAccept(int id ) async{
    String myUrl = "http://192.168.43.116/api/v1/checkAccept/$id";
    await _getToken();
    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    Appointments appointments= Appointments.fromJson(jsonData);
    List<Appointment> appointmentsList = appointments.appointments.map((e) => Appointment.fromJson(e)).toList();
    return appointmentsList ;
  }



  ///function check proposition
  Future<List<AppointmentUser>> checkPropositionUser( ) async{
    String myUrl = "http://192.168.43.116/api/v1/checkPropositionUser";
    await _getToken();
    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    AppointmentsUser appointments= AppointmentsUser.fromJson(jsonData);
    List<AppointmentUser> appointmentsList = appointments.appointmentsUser.map((e) => AppointmentUser.fromJson(e)).toList();
    return appointmentsList ;
  }
  ///function check demandes appointment
  Future<List<AppointmentUser>> checkRequestUser( ) async{
    String myUrl = "http://192.168.43.116/api/v1/checkRequestUser";
    await _getToken();
    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    AppointmentsUser appointments= AppointmentsUser.fromJson(jsonData);
    List<AppointmentUser> appointmentsList = appointments.appointmentsUser.map((e) => AppointmentUser.fromJson(e)).toList();
    return appointmentsList ;
  }
  ///function check Refuse appointment
  Future<List<AppointmentUser>> checkRefuseUser( ) async{
    String myUrl = "http://192.168.43.116/api/v1/checkRefuseUser";
    await _getToken();
    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    AppointmentsUser appointments= AppointmentsUser.fromJson(jsonData);
    List<AppointmentUser> appointmentsList = appointments.appointmentsUser.map((e) => AppointmentUser.fromJson(e)).toList();
    return appointmentsList ;
  }
  ///function check accept appointment
  Future<List<AppointmentUser>> checkAcceptUser() async{
    String myUrl = "http://192.168.43.116/api/v1/checkAcceptUser";
    await _getToken();
    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    AppointmentsUser appointments= AppointmentsUser.fromJson(jsonData);
    List<AppointmentUser> appointmentsList = appointments.appointmentsUser.map((e) => AppointmentUser.fromJson(e)).toList();
    return appointmentsList ;
  }
/// verifier si un nouveau user
  newPatient()
  async {
    String myUrl = "http://192.168.43.116/api/v1/isNewPatient";
    await _getToken();
    return await http.get(myUrl,
        headers: _setHeaders());

  }

  /// verifier si un nouveau medecin
  newMedecin(int id)
  async {
    String myUrl = "http://192.168.43.116/api/v1/isNewDoctor/$id";
    await _getToken();
    return await http.get(myUrl,
        headers: _setHeaders());

  }

///propositions dans home
  Future<List<AppointmentUser>> checkPropositionUser2( ) async{
    String myUrl = "http://192.168.43.116/api/v1/checkPropositionUser";
    await _getToken();
    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    AppointmentsUser appointments= AppointmentsUser.fromJson(jsonData);
    List<AppointmentUser> appointmentsList = appointments.appointmentsUser.map((e) => AppointmentUser.fromJson(e)).toList();
    return appointmentsList ;
  }



  /// your doctors : les medecins deja consultees par patient

  Future<List<Doctor>> yourDoctors( ) async{
    String myUrl = "http://192.168.43.116/api/v1/yourDoctors";
    await _getToken();

    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    Doctors doctors= Doctors.fromJson(jsonData);
    List<Doctor> doctorsList = doctors.doctors.map((e) => Doctor.fromJson(e)).toList();
    return doctorsList ;
  }
/// categories
  Future<List<Categorie>> categories( ) async{
    String myUrl = "http://192.168.43.116/api/v1/categories";
    await _getToken();

    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
    String data = response.body;
    var jsonData = jsonDecode(data);
    Categories categories= Categories.fromJson(jsonData);
    List<Categorie> categoriesList = categories.categories.map((e) => Categorie.fromJson(e)).toList();
    return categoriesList ;
  }


   Future<List<Doctor>> search(String name ) async{
    String myUrl = "http://192.168.43.116/api/v1/doctors/$name";
    await _getToken();
    

    http.Response response = await http.get(myUrl,
        headers: _setHeaders());
       String data = response.body;
       var jsonData = jsonDecode(data);
       Doctors doctors= Doctors.fromJson(jsonData);
       List<Doctor> doctorsList = doctors.doctors.map((e) => Doctor.fromJson(e)).toList();
    return doctorsList ;
  }

  getData(apiUrl) async {
    var fullUrl = Uri.parse(_url + apiUrl);
    await _getToken();
    return await http.get(
        fullUrl,
        headers: _setHeaders()
    );
  }


  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

}