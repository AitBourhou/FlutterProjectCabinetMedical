import 'package:app_cabinet_medic/models/doctor_module.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:app_cabinet_medic/pages/DetailShow.dart';


import 'package:app_cabinet_medic/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MySearch extends StatefulWidget{


  MySearch({Key key,this.title}): super(key: key);
  final String title;




  @override
  _MySearchState createState() => new _MySearchState();

}
class _MySearchState extends State<MySearch>
{
  String name;
  TextEditingController nameController = TextEditingController();
  @override

  String dropdownvalue2 = 'Ville';
  String dropdownvalue = 'Categorie';


  var search = "cardiologique";
  List<Doctor> doctors;







  var items2 =  ['Ville','casa','marrakech','agadir','fes','rabat'];
  var items =  ['Categorie','cardiologie','pédiatre','dermatologie','générale','Neurologie'];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title:Text("Rechercher"),
      ),

      body: Container(
        child: Column(
          children: <Widget>[



            Padding(
                padding: EdgeInsets.all(16.0),


                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'saisie nom medecin',

                    ),
                  ),
                ),


            SizedBox(
              width: 21,
            ),
            Row(

              children: <Widget>[

                Expanded(child: DropdownButton(
                  value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items:items.map((String items) {
                    return DropdownMenuItem(
                        value:items,
                        child: Text(items)
                    );
                  }
                  ).toList(),
                  onChanged: (String newValue){
                    setState(() {
                      dropdownvalue = newValue;
                    });
                  },
                ),
                ),

                Expanded(child: DropdownButton(
                  value: dropdownvalue2,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items:items2.map((String items) {
                    return DropdownMenuItem(
                        value:items,
                        child: Text(items)
                    );
                  }
                  ).toList(),
                  onChanged: (String newValue){
                    setState(() {
                      dropdownvalue2 = newValue;
                    });
                  },
                ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 40.0,
              width: 230.0,

              child: RaisedButton(
                shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),

                onPressed: () async{
                  if(nameController.text != ''){
                   doctors = await Network().search(nameController.text);}

                    if(dropdownvalue2 != 'Ville')

                      {
                        doctors = await Network().search(dropdownvalue2);
                      }
                  if(dropdownvalue != 'Categorie')

                  {
                    doctors = await Network().search(dropdownvalue);
                  }


                  for( var doctor in doctors )
                    {

                       print(doctor.firstname);
                       print(nameController.text);
                       print(dropdownvalue);
                       print(dropdownvalue2);

                    }

                  if(doctors.isEmpty)
                  {
                    _showDialog('ce médecin n existe pas');
                  }else{
                  Navigator.of(context).push(

                    MaterialPageRoute(
                      builder: (context) => DetailShow(hDoctors : doctors),
                    ),
                  );}



                },

                color: Color.fromRGBO(0, 160, 227, 1),
                textColor: Colors.white,
                child: Text("Search",
                    style: TextStyle(fontSize: 19)),
              ),
            ),

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
              child: new Text("Fermer"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  


}
