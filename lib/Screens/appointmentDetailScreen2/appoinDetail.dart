import 'package:app_cabinet_medic/Screens/appointmentDetailScreen2/ApointmentAccepted.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen2/AppointmentProgress.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen2/AppointmentRefused.dart';
import 'package:app_cabinet_medic/models/appointment.dart';
import 'package:app_cabinet_medic/pages/home_page.dart';
import 'package:app_cabinet_medic/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen2/propositionAppointment.dart';
import 'package:app_cabinet_medic/models/doctor_module.dart';
import 'package:app_cabinet_medic/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../ProfilePage.dart';




class MyAppoinDetail extends StatefulWidget{
  Doctor doctorAppointment;
 /// MyAppoinDetail({this.doctorAppointment});


  MyAppoinDetail({Key key,this.title,this.doctorAppointment}): super(key: key);
  final String title;
  @override
  _MyAppoinDetailState createState() => new _MyAppoinDetailState(doctorAppointment);

}
class _MyAppoinDetailState extends State<MyAppoinDetail>
{
  List<Appointment> appointmentsPropo;
  List<Appointment> appointmentsAccept;
  List<Appointment> appointmentsRefuse;
  List<Appointment> appointmentsRequest;
  Doctor doctorAppointment;
  _MyAppoinDetailState(this.doctorAppointment);
  var x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
      title:Text("Mes Rendez-Vous"),
    ),
      drawer : new Drawer(

        child: Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              new ListTile(
                  leading: Icon(Icons.home),

                  title: new Text("Accueil"),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>  HomePage()
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>  super.widget
                      ),
                    );
                  }),
              new ListTile(
                  leading: Icon(Icons.perm_identity_outlined),
                  title: new Text("Profile"),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => ProfilePage()
                      ),
                    );
                  }),
              ///account_circle AppointmentScreen
              new ListTile(
                  leading: Icon(Icons.calendar_today_outlined),
                  title: new Text("Mes Rendez-Vous"),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MyAppoinDetail()
                      ),
                    );
                  }),



              new Divider(),

              new ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: new Text("Déconnexion"),
                  onTap: () {
                    logout();

                  }),
            ],
          ),
        ),
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
                 appointmentsPropo = await Network().checkPropo(doctorAppointment.id);


                Navigator.push(
                   context,
                   new MaterialPageRoute(
                       builder: (context) => propoAppoi(appointmentsPropo : appointmentsPropo , doctorAppointment : doctorAppointment)
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
                 appointmentsRequest = await Network().checkRequest(doctorAppointment.id);



                 Navigator.push(
                   context,
                   new MaterialPageRoute(
                       builder: (context) => AppointmentProgress(appointmentsRequest : appointmentsRequest , doctorAppointment : doctorAppointment)

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
                 appointmentsAccept = await Network().checkAccept(doctorAppointment.id);


                 Navigator.push(
                   context,
                   new MaterialPageRoute(
                       builder: (context) => AppointmentAccepted(appointmentsAccept : appointmentsAccept , doctorAppointment : doctorAppointment)
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
                     appointmentsRefuse = await Network().checkRefuse(doctorAppointment.id);


                     Navigator.push(
                       context,
                       new MaterialPageRoute(
                           builder: (context) => AppointmentRefused(appointmentsRefuse : appointmentsRefuse , doctorAppointment : doctorAppointment)
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
