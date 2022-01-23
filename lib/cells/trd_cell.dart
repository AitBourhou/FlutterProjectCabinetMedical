import 'package:app_cabinet_medic/models/doctor.dart';
import 'package:app_cabinet_medic/utils/custom_icons_icons.dart';
import 'package:app_cabinet_medic/utils/he_color.dart';
import 'package:flutter/material.dart';
import 'package:app_cabinet_medic/Screens/ProfilePage.dart';
import 'package:app_cabinet_medic/pages/searchMultiple.dart';
import 'package:app_cabinet_medic/models/appointmentUser.dart';
import 'package:app_cabinet_medic/models/appointmentsUser.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen/appointmentPropositopnHome.dart';
import 'package:app_cabinet_medic/Screens/appointmentDetailScreen/appointmentReminder.dart';


class MessagesCard extends StatelessWidget {

  final Color color;
  final Icon icon;
  AppointmentUser appointmentReminder  ;

   MessagesCard({Key key, this.color, this.icon,this.appointmentReminder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 3.0, offset: Offset(0,1))]
      ),
      margin: EdgeInsets.symmetric(vertical: 11.0, horizontal: 5.0),
      padding: EdgeInsets.all(11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: icon,
          ),
          SizedBox(
            width: 21,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Rappel Rendez-Vous",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    Spacer(),
                    Text(
                        appointmentReminder.heure,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                  ' avec Dr. ' +appointmentReminder.name+
                      appointmentReminder.firstname,
                      style: TextStyle(color: Colors.deepOrangeAccent),
                    ),

                    Material(
                      color: Colors.transparent,
                      child: IconButton(


                        icon: Icon(Icons.chevron_right),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => AppointmentAccepted(appointmentsAccept:appointmentReminder)
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PropositionCard extends StatelessWidget {

  final Color color;
  final Icon icon;
  AppointmentUser appointment  ;


   PropositionCard({Key key, this.color, this.icon,this.appointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 3.0, offset: Offset(0,1))]
      ),
      margin: EdgeInsets.symmetric(vertical: 11.0, horizontal: 5.0),
      padding: EdgeInsets.all(11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: icon,
          ),


          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Proposition Rendez-Vous",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Spacer(),
                    Text(
                      appointment.heure,

                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      ' avec Dr.'+appointment.name+'   '+appointment.firstname,
                    ),

                    Material(
                      color: Colors.transparent,
                      child: IconButton(


                        icon: Icon(Icons.chevron_right),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => propoAppoi(appointmentsPropo : appointment)
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




