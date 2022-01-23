import 'package:app_cabinet_medic/cells/category_cell.dart';
import 'package:app_cabinet_medic/cells/hd_cell3.dart';
import 'package:app_cabinet_medic/cells/trd_cell.dart';
import 'package:app_cabinet_medic/models/categorie.dart';
import 'package:app_cabinet_medic/models/category.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen/apponDetail3.dart';
import 'package:app_cabinet_medic/pages/detail_page3.dart';
import 'package:app_cabinet_medic/pages/searchMultiple.dart';
import 'package:app_cabinet_medic/Screens/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:app_cabinet_medic/pages/login.dart';
import 'package:app_cabinet_medic/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_cabinet_medic/models/doctor_module.dart';
import 'package:app_cabinet_medic/models/appointmentUser.dart';
import 'package:app_cabinet_medic/models/appointmentsUser.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  List<Doctor> _hDoctors = [] ;
  List<AppointmentUser> appointments = [] ;

  AppointmentUser appointment;
  List<AppointmentUser> appointmentsReminder = [] ;

  AppointmentUser appointmentReminder;

  List<Categorie> categories = [] ;

  /// **********************************************
  /// ACTIONS
  /// **********************************************


  _onCellTap(Doctor doctor) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(doctor: doctor),
        ));
  }

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  void initState()  {
    super.initState();

    _getCategories();
    _getDoctors();
    _getAppointments();
    _getAppReminder();


  }
  _getCategories() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var hcategories = await Network().categories();

    if (user != null) {
      setState(() {
        categories = hcategories;
      });
    }
  }
  _getDoctors() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var Doctors = await Network().yourDoctors();

    if (user != null) {
      setState(() {
        _hDoctors = Doctors;
      });
    }
  }
  _getAppointments() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var Appointmments = await Network().checkPropositionUser2();

    if (user != null) {
      setState(() {
        appointments = Appointmments;




      });
    }
  }
  _getAppReminder() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    var Appointmments = await Network().checkAcceptUser();

    if (user != null) {
      setState(() {
        appointmentsReminder = Appointmments;




      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(



        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(""),
          iconTheme: IconThemeData(color: Colors.blue),
            actions: <Widget>[
         IconButton(


        icon: Icon(Icons.search),
    onPressed: () {
    Navigator.push(
    context,
    new MaterialPageRoute(
    builder: (context) => MySearch()),
    );

    },

    ),
              SizedBox(
                width: 25,
              ),


              SizedBox(
                width: 25,
              ),

              SizedBox(
                width: 162,
              ),
              Image(
                width: 90,

                height: 110,

              image: AssetImage('assets/images/logo.png'),
              ),
              SizedBox(
                width: 10,
              ),


    ],
    ),
    ///_MyStatefulWidgetState

      drawer : new Drawer(

    child: Container(
      color: Colors.white,
        child: new ListView(
          children: <Widget>[
            new ListTile(
                leading: Icon(Icons.home),
                title: new Text("Accueil"),
                onTap: () {
                  Navigator.pop(context);
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
                title: new Text("Mes Rendez-Vous "),
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
                title: new Text("Logout"),
                onTap: () {
                  logout();

                }),
          ],
        ),
      ),
      ),


      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 22,
            ),



            _hDoctorsSection(),


            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _categorySection(),
                  SizedBox(
                    height: 32,
                  ),
                   if(appointmentsReminder != [])
                  _trDoctorsSection(),
                  if(appointmentsReminder == [])
                     Text(
                     'Vous avez aucune rendez_vous accepté',

                      style: TextStyle(
                     color: Colors.black45,
                      fontSize: 22,
                         fontWeight: FontWeight.w400,
                         ),

                 ),
                  if(appointments != [])
                  _propositionSection(),
    if(appointments == [])
    Text(
    'Vous avez aucune proposition d une rendez_vous ',

    style: TextStyle(
    color: Colors.black45,
    fontSize: 22,
    fontWeight: FontWeight.w400,
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

  SizedBox _hDoctorsSection() {
    return SizedBox(

      height: 199,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemCount: _hDoctors.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(indent: 40),
        itemBuilder: (BuildContext context, int index) => HDCell(
          doctor: _hDoctors[index],
          onTap: () => _onCellTap(_hDoctors[index]),
        ),
      ),
    );
  }

  /// Category Section


  /// Top Rated Doctors Section
  Column _trDoctorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rappel',

          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),

        ),




        SizedBox(
          height: 32,
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: appointmentsReminder.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 16,
            color: Colors.transparent,
          ),
          itemBuilder: (BuildContext context, int index) =>
              MessagesCard(appointmentReminder: appointmentsReminder[index]),
        ),

      ],
    );
  }


  Column _propositionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Propositions ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: appointments.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 16,
            color: Colors.transparent,
          ),
          itemBuilder: (BuildContext context, int index) =>
              PropositionCard(appointment:appointments[index]),
        ),
      ],
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catégories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),

        ),
        SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(indent: 16),
            itemBuilder: (BuildContext context, int index) =>
                CategoryCell(categorie: categories[index]),
          ),
        ),
      ],
    );
  }


  /// Get Top Rated Doctors List
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

  /// logout

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
