import 'package:app_cabinet_medic/models/category.dart';
import 'package:app_cabinet_medic/utils/he_color.dart';
import 'package:flutter/material.dart';
import 'package:app_cabinet_medic/pages/home_page.dart';
import 'package:app_cabinet_medic/models/categorie.dart';
import 'package:app_cabinet_medic/models/doctor_module.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:app_cabinet_medic/pages/DetailShow.dart';


import 'package:app_cabinet_medic/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryCell extends StatelessWidget {
  Categorie categorie  ;
  List<Doctor> doctors ;

  CategoryCell({Key key,  this.categorie}) : super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                IconButton(

                  color: Colors.lightBlue,
                  /// icon: Icon(Icons.arrow_circle_down_rounded),
                icon: Image.asset(

                  'assets/images/' + categorie.icon,
                  width: 24.0,
                  height: 24.0,

                ),

                  onPressed: () async {
                    doctors = await Network().search(categorie.name);
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => DetailShow(hDoctors : doctors),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  categorie.name,

                  style: TextStyle(
                    color: HexColor('#010101'),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
