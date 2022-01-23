import 'package:app_cabinet_medic/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:app_cabinet_medic/models/doctor_module.dart';
import 'package:app_cabinet_medic/models/appointmentUser.dart';
import 'package:app_cabinet_medic/models/appointmentsUser.dart';
import 'package:app_cabinet_medic/network_utils/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';




class propoAppoi extends StatefulWidget{

  List<AppointmentUser> appointmentsPropo = [];
  propoAppoi({Key key,this.title,this.appointmentsPropo}): super(key: key);
  final String title;
  @override
  _propoAppoiState createState() => new  _propoAppoiState(appointmentsPropo);

}
class _propoAppoiState extends State<propoAppoi>

{
  String name = '';
  String firstname = '';
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
        firstname=user['firstname'];
      });
    }
  }

  List<AppointmentUser> appointmentsPropo;
  _propoAppoiState(this.appointmentsPropo);
  var x=2;
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


            for(var appointment in appointmentsPropo)

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
                                '                   Proposition Rendez_Vous',
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
                                      image: DecorationImage(image: AssetImage('assets/images/' + appointment.photo),fit: BoxFit.fill),
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
                                      'Dr.'+ appointment.name + ' \n' +appointment.firstname ,


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
                      Expanded(

                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                            RaisedButton(


                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),



                              child: Text("           Accepter          "),
                              color: Colors.indigo,

                   onPressed: () { _acceptAppointment(appointment.id);},


                            ),

                            SizedBox(width: 10),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                              child: Text("         Refuser             "),
                              onPressed: () { _refuseAppointment(appointment.id);},
                            ),
                          ],
                        ),

                      ),


                    ],
                  ),

                ),
              ),


            SizedBox(height: 10),







          ],
        ),
      ),





    );

  }
  void _showDialog(msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(

          content: new Text(msg),

          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }
  void _acceptAppointment(id) async{

    var res = await Network().ButtonAccept(id);
    var body = json.decode(res.body);
    if(body['success']){
      _showDialog('rendez-vous accepté');}
    else {
      print(" against");
    }

  }
  void _refuseAppointment(id) async{

    var res = await Network().ButtonRefuse(id);
    var body = json.decode(res.body);
    if(body['success']){
      _showDialog('rendez-vous refusé');}
    else {
      print(" against");
    }

  }

}