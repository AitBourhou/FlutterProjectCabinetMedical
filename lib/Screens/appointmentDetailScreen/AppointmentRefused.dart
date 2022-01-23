import 'package:flutter/material.dart';
import 'package:app_cabinet_medic/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:app_cabinet_medic/models/doctor_module.dart';



class AppointmentRefused extends StatefulWidget{
  Doctor doctorAppointment;
  List<Appointment> appointmentsRefuse;


  AppointmentRefused({Key key,this.title,this.doctorAppointment,this.appointmentsRefuse}): super(key: key);
  final String title;
  @override
  _AppointmentRefusedState createState() => new  _AppointmentRefusedState(appointmentsRefuse,doctorAppointment);

}
class _AppointmentRefusedState extends State<AppointmentRefused>
{ var x=2;
String name;
String firstname;
@override
void initState(){
  _loadUserData();
  super.initState();
}
_loadUserData() async{
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var user = jsonDecode(localStorage.getString('user'));

  if(user != null) {
    setState(() {
      name = user['name'];
      firstname = user['firstname'];
    });
  }
}
Doctor doctorAppointment;
List<Appointment> appointmentsRefuse;
_AppointmentRefusedState(this.appointmentsRefuse,this.doctorAppointment);
@override
Widget build(BuildContext context) {
  return Scaffold(

    appBar: AppBar(
      actions: <Widget>[
      ],


    ),
    body: Container(
      child: Column(


        children: <Widget> [

          Expanded(
            flex: 2,

            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


              ],

            ),



          ),

          for(var appointment in appointmentsRefuse)
            Expanded(
              flex: 3,

              child: Container(

                ///decoration: BoxDecoration(
                /// color: Color(0xff2C8BFF),
                ///  borderRadius: BorderRadius.only(
                ///    topLeft: Radius.circular(25),
                ///    topRight: Radius.circular(25))),
                decoration: BoxDecoration(
                  ///color: Color.fromRGBO(64, 75, 96, 9),
                    color: Colors.white,

                    boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 3.0, offset: Offset(0,1))]
                ),
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Column(
                  ///crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ///proposition appointment
                    Expanded(

                      child: Row(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              '                  Rendez-Vous Refusé',
                              style: TextStyle(
                                  fontSize:20,
                                  color: Colors.black87),
                            ),
                          ),

                        ],
                      ),
                    ),
                    /// time
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                              Icons.access_time,
                              size: 20,
                              color: Colors.black87
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            appointment.dateApp +'\n'+ appointment.heure,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                    /// doctor
                    Expanded(

                      child: Container(

                        //color: Colors.pink,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 50),
                            Expanded(
                              flex: 3,
                              child: Container(


                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/images/' + doctorAppointment.photo),fit: BoxFit.fill),
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: <Widget>[
                                  Text(
                                    'Dr.'+ doctorAppointment.name + ' \n' + doctorAppointment.firstname ,


                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(


                                        color: Colors.black87),
                                  ),
                                  Text(

                                    'nom patient'+
                                        name ,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(


                                        color: Colors.black87),
                                  )
                                ],
                              ),
                            ),

                            Expanded(

                              child: Container(),),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    /// bttton accept refuse



                  ],
                ),

              ),
            ),
          SizedBox(height: 20),







        ],
      ),
    ),





  );

}
}