import 'dart:convert';

import 'package:app_cabinet_medic/Screens/ProfilePage.dart';
import 'package:app_cabinet_medic/cells/detail_cell.dart';
import 'package:app_cabinet_medic/utils/custom_icons_icons.dart';
import 'package:app_cabinet_medic/utils/he_color.dart';
import 'package:flutter/material.dart';
import 'package:app_cabinet_medic/pages/searchMultiple.dart';
import 'package:app_cabinet_medic/pages/AppointmentDoctor.dart';
import 'package:app_cabinet_medic/models/doctor_module.dart';
import 'package:app_cabinet_medic/network_utils/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen/appoinDetail.dart';

import 'home_page.dart';
import 'login.dart';

class DetailPage extends StatefulWidget {
  Doctor doctor;

   DetailPage({Key key, @required this.doctor}) : super(key: key);


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************
  String result = '';
  String resl='';
  @override
  void initState()  {
    super.initState();

    getResult();
    getRes();


  }
  getResult() async {
    var res = await Network().newMedecin(widget.doctor.id);
    var body = json.decode(res.body);


    if(body['result']){

      setState(() {
        result = 'vous avez jamais un rendez-vous avec ce médecin';
      });

    }

  }
  getRes() async {
    var res = await Network().activeButtonMake(widget.doctor.id);
    var body = json.decode(res.body);


    if(body['result']){

      setState(() {
        resl = 'active';
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleSection(),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr.' +

                        widget.doctor.name + ' ' + widget.doctor.firstname


                    ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.edit_location,
                        size: 14,

                        color: HexColor('#C6C6CD'),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.doctor.address +'\n'+
                            widget.doctor.city,
                        style: TextStyle(
                          color: HexColor('#C6C6CD'),

                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(

                      color: Colors.black,

                      border: Border.all(color: HexColor('#FFEDBE'), width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.doctor.specialty,
                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Icon(
                    Icons.add_ic_call_outlined ,
                    size: 14,

                    color: HexColor('#C6C6CD'),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(

                    widget.doctor.phone ,
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    'Description : '+'\n'+
                        widget.doctor.Description ,
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text( result,
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  if(resl != '')
                    SizedBox(
                      height: 32,

                      child: RaisedButton(
                        onPressed: () {
                          _makeAppointment();

                        },
                        elevation: 0.0,
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(25.25),
                        ),
                        child: Center(
                          child: Text(
                            "demande Rendez-Vous",

                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 32,

                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAppoinDetail(doctorAppointment : widget.doctor)));
                      },

                      elevation: 0.0,
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.25),
                      ),
                      child: Center(
                        child: Text(
                          "Consulter les Rendez-Vous",

                        ),
                      ),
                    ),


                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// App Bar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.cyan,

      elevation: 0,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_sharp, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  /// Title Section
  Container _titleSection() {
    return Container(
      height: 250,
      color: Colors.cyan,

      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 207,
              height: 178,
              child: Image(
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/bg_shape.png'),
              ),
            ),
          ),
          Positioned(
            right: 64,
            bottom: 15,
            child: SizedBox(
              height: 250,
              child: AspectRatio(
                aspectRatio: 196 / 285,
                child: Hero(
                  tag: widget.doctor.firstname ,
                 child: Image(
                     filterQuality: FilterQuality.high,
                     fit: BoxFit.fitHeight,
                     image: AssetImage('assets/images/' + widget.doctor.photo , ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 15,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }
  /// new patient

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
  void _makeAppointment() async{

    var res = await Network().makeAppointment(widget.doctor.id);
    var body = json.decode(res.body);
    if(body['success']){
      _showDialog('Rendez-Vous Envoyé');}
    else {
      print(" against");
    }

  }
}
