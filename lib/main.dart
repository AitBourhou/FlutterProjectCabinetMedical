import 'package:flutter/material.dart';
import 'package:app_cabinet_medic/pages/login.dart';
import 'package:app_cabinet_medic/pages/home.dart';
import 'package:app_cabinet_medic/pages/home_page.dart';
import 'package:app_cabinet_medic/pages/HomeNewUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_cabinet_medic/Constant/Constant.dart';
import 'package:app_cabinet_medic/Screens/SplashScreen.dart';
import 'package:app_cabinet_medic/Screens/ProfilePage.dart';
import 'package:app_cabinet_medic/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      home: CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  String result2 = '';

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }

  /// new patient
  void newPatient() async{
    var res = await Network().newPatient();
    var body = json.decode(res.body);

    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      result2 = jsonDecode(localStorage.getString('result'));
      print(result2);

    }

  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      if(result2 == ""){
      child = Login();}
      else{
        child =Login();
      }
    }
    else {
      child = Login();
    }
    return Scaffold(
      body: child,
    );
  }
}