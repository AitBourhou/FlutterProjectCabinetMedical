import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class getDataApi{


  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

    Future<Map<String, dynamic>> getData() async{
    String myUrl ="http://192.168.43.116/api/v1/user";


    http.Response response = await http.get(myUrl, headers: {

    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token' });

    return json.decode(response.body);





  }











}