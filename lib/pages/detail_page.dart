import 'package:app_cabinet_medic/cells/detail_cell.dart';
import 'package:app_cabinet_medic/models/doctor.dart';
import 'package:app_cabinet_medic/utils/custom_icons_icons.dart';
import 'package:app_cabinet_medic/utils/he_color.dart';
import 'package:flutter/material.dart';
import 'package:app_cabinet_medic/pages/searchMultiple.dart';
import 'package:app_cabinet_medic/pages/AppointmentDoctor.dart';

class DetailPage extends StatefulWidget {
  final Doctor doctor;

  const DetailPage({Key key, @required this.doctor}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
                        widget.doctor.firstName +
                        ' ' +
                        widget.doctor.lastName,
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
                        'Melbourn, Australia',
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
                      widget.doctor.type + ' Specialist',
                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Dr. Albert Alexanderis a Renal Physician who has comprehensive expertise in the fields of Renal Medicine and Internal Medicine. While Dr Ho specializes in dialysis and critical care nephrology, years of extensive training have also equipped him with skills to effectively handle a wide range of other kidney diseases, including kidney impairment, inflammation, infection and transplantation.',
                    style: TextStyle(
                      color: HexColor('#9E9E9E'),
                              fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),

                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 32,

                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => MySearch()),
                      );
                    },
                    elevation: 0.0,
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.25),
                    ),
                    child: Center(
                      child: Text(
                        "make appointment",

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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AppointmentDoctor()));
                      },
                      elevation: 0.0,
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.25),
                      ),
                      child: Center(
                        child: Text(
                          "Check appointment",

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
                  tag: widget.doctor.firstName + widget.doctor.lastName,
                  child: Image(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/images/' + widget.doctor.image),
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
}
