import 'package:app_cabinet_medic/network_utils/api.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:app_cabinet_medic/models/doctor_module.dart';
import 'package:app_cabinet_medic/pages/detail_page2.dart';
import 'package:app_cabinet_medic/cells/hd_cell2.dart';
import 'package:app_cabinet_medic/Screens/ProfilePage.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen/apponDetail3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'login.dart';



class DetailShow extends StatefulWidget {
  List<Doctor> hDoctors;
  DetailShow({this.hDoctors});
  @override
  _DetailShowState createState() => _DetailShowState(hDoctors);
}

class _DetailShowState extends State<DetailShow> {

  List<Doctor> hDoctors;
  _DetailShowState(this.hDoctors);

  Doctor doctor;
  _onCellTap(Doctor doctor) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(doctor: doctor),
        ));
  }
  @override
  void initState() {
    super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(" "),


      ),
      ///_MyStatefulWidgetState


      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            _hDoctorsSection(),



          ],
        ),
      ),
    );



  }
  SizedBox _hDoctorsSection() {
    return SizedBox(
      height: 199,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemCount: hDoctors.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(indent: 40),
        itemBuilder: (BuildContext context, int index) => HDCell(
          doctor: hDoctors[index],
          onTap: () => _onCellTap(hDoctors[index]),
        ),
      ),
    );
  }

  void logout() async{
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if(body['success']!= null){
      if(body['success']){
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.remove('user');
        localStorage.remove('token');
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Login()));
      }
    }else{

      print(body.toString());
    }
  }




}