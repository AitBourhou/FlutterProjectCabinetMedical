import 'package:app_cabinet_medic/Screens/appointmentDetailScreen2/ApointmentAcceptedUser.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen2/AppointmentProgressUser.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen2/AppointmentRefusedUser.dart';
import 'package:app_cabinet_medic/models/appointment.dart';
import 'package:app_cabinet_medic/pages/home_page.dart';
import 'package:app_cabinet_medic/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen2/propositionAppointmentUser.dart';
import 'package:app_cabinet_medic/models/doctor_module.dart';
import 'package:app_cabinet_medic/network_utils/api.dart';
import 'package:app_cabinet_medic/models/appointmentUser.dart';
import 'package:app_cabinet_medic/models/appointmentsUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import '../ProfilePage.dart';




class MyAppoinDetail extends StatefulWidget{

  /// MyAppoinDetail({this.doctorAppointment});


  MyAppoinDetail({Key key,this.title}): super(key: key);
  final String title;
  @override
  _MyAppoinDetailState createState() => new _MyAppoinDetailState();

}
class _MyAppoinDetailState extends State<MyAppoinDetail>
{
  List<AppointmentUser> appointmentsPropo;
  List<AppointmentUser> appointmentsAccept;
  List<AppointmentUser> appointmentsRefuse;
  List<AppointmentUser> appointmentsRequest;

  _MyAppoinDetailState();
  var x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("Mes Rendez-Vous"),
      ),



      body: Container(
        child: Column(

          children: <Widget> [

            Expanded(
              child: SizedBox(),
            ),

            Expanded(

              child: SizedBox(

                width: double.infinity,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 34.0, right: 34.0, top: 16),
                  child: RaisedButton(
                    textColor: Colors.black,
                    color: Colors.lightBlueAccent,

                    onPressed: () async {
                      // Respond to button press
                      appointmentsPropo = await Network().checkPropositionUser();


                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => propoAppoi(appointmentsPropo : appointmentsPropo )
                        ),
                      );
                    },


                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("Proposition des Rendez-Vous",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
            ),
            Expanded(

              child: SizedBox(

                width: double.infinity,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 34.0, right: 34.0, top: 16),
                  child: RaisedButton(
                    textColor: Colors.black,
                    color: Colors.lightBlueAccent,

                    onPressed: () async {
                      appointmentsRequest = await Network().checkRequestUser();



                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => AppointmentProgress(appointmentsRequest : appointmentsRequest )

                        ),
                      );
                      // Respond to button press


                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("Demande des Rendez-Vous en attentes ",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
            ),
            SizedBox(),

            Expanded(

              child: SizedBox(

                width: double.infinity,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 34.0, right: 34.0, top: 16),
                  child: RaisedButton(
                    textColor: Colors.black,
                    color: Colors.lightBlueAccent,
                    onPressed: () async {
                      // Respond to button press
                      appointmentsAccept = await Network().checkAcceptUser();


                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => AppointmentAccepted(appointmentsAccept : appointmentsAccept )
                        ),
                      );
                      // Res

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("Rendez_Vous Acceptés",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
            ),
            SizedBox(),
            /// if(x==3)

            Expanded(

              child: SizedBox(

                width: double.infinity,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 34.0, right: 34.0, top: 16),
                  child: RaisedButton(
                    color: Colors.lightBlueAccent,

                    onPressed: () async {
                      appointmentsRefuse = await Network().checkRefuseUser();


                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => AppointmentRefused(appointmentsRefuse : appointmentsRefuse)
                        ),
                      );
                      // Respond to button press

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text("Rendez-Vous Refusés",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0))),
                  ),
                ),
              ),
            ),


            Expanded(

              child: SizedBox(),),
            Expanded(

              child: SizedBox(),),

          ],








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
