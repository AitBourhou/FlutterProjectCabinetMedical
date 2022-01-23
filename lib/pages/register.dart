import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app_cabinet_medic/network_utils/api.dart';
import 'package:app_cabinet_medic/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_cabinet_medic/pages/login.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  var name;
  var phone;




  @override
  Widget build(BuildContext context) {
    return Material(


      child: Container(

        color: Colors.amber,
        child: Stack(
          children: <Widget>[


            Positioned(

        child:DecoratedBox(
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage('assets/images/background2.jpg'),
        fit: BoxFit.cover,
      ),
    ),


    child: Padding(
                     padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),

                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              TextFormField(
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (emailValue) {
                                  if (emailValue.isEmpty) {
                                    return 'Merci de saisir un email';
                                  }
                                  email = emailValue;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.insert_emoticon,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Nom",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (nameValue) {
                                  if (nameValue.isEmpty) {
                                    return 'Merci de saisir votre nom';
                                  }
                                  name = nameValue;
                                  return null;
                                },
                              ),

                              TextFormField(
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  hintText: "téléphone",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (phonenumber) {
                                  if (phonenumber.isEmpty) {
                                    return 'Merci de saisir votre téléphone';
                                  }
                                  phone = phonenumber;
                                  return null;
                                },
                              ),
                              TextFormField(
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Mot de passe",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (passwordValue) {
                                  if (passwordValue.isEmpty) {
                                    return 'Entrer le Mot de passe';
                                  }
                                  password = passwordValue;
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      _isLoading? 'Analyse...' : 'Inscription',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Colors.teal,
                                  disabledColor: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(20.0)),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _register();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Login()));
                        },

                        child: Text(
                          'Vous avez déjà une compte',
                          style: TextStyle(

                            backgroundColor: Colors.white,
                            color: Colors.cyan,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            )
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


  void _register()async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email' : email,
      'password': password,
      'phone': phone,
      'name': name
    };

    var res = await Network().authData(data, '/register');
    var body = json.decode(res.body);

    if(body['success']==null){
      _showDialog(body.toString());


    }
    else{

    if(body['success']){
      print(body.toString());
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => HomePage()
        ),
      );
    }
    else{

      _showDialog(body.toString());

    }




    setState(() {
      _isLoading = false;
    });
  }}


}
