import 'package:flutter/material.dart';

class AppointmentDoctor extends StatefulWidget {
  AppointmentDoctor({Key key}) : super(key: key);
  @override
  _AppointmentDoctor createState() => _AppointmentDoctor();

}

class _AppointmentDoctor extends State<AppointmentDoctor> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: _appBar(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(


            child: Column(


              children: <Widget> [
                Text(
                  'Your Appointments with this Doctor',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),

                Expanded(

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      RaisedButton(
                          child: Text("Make Appointment" ,style: TextStyle(color: Colors.white , fontSize: 10, fontWeight: FontWeight.bold),),

                          color: Colors.black12,

                          onPressed: () {}

                      ),


                    ],

                  ),



                ),

                Expanded(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Color(0xff2C8BFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ///proposition appointment
                        Expanded(
                          child: Row(

                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  'Appointment Proposition',
                                  style: TextStyle(
                                      fontSize:20,
                                      color: Colors.white),
                                ),
                              ),

                            ],
                          ),
                        ),
                        /// time
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'appointmentDate , widget.appointmentTime',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70),
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
                                Expanded(
                                  flex: 3,
                                  child: Container(


                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/images/background.jpg'),fit: BoxFit.fill),
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Dr.+ widget.patienSurname' ,


                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(


                                            color: Colors.black87),
                                      ),
                                      Text(

                                        'widget.patienName',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(


                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),

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
                                color: Colors.white,

                                ///shape: RoundedRectangleBorder(
                                /// borderRadius: BorderRadius.circular(18.0),

                                ///),


                                child: Text("           Accept          "),

                                onPressed: null,
                              ),

                              SizedBox(width: 50),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                                child: Text("         Refuse             "),
                                onPressed: null,
                              ),
                            ],
                          ),

                        ),


                      ],
                    ),

                  ),
                ),
                SizedBox(height: 20),


                Expanded(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Color(0xff2C8BFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// appointment in progress
                        Expanded(
                          child: Row(

                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '                  Appointment in progress',
                                  style: TextStyle(
                                      fontSize:20,
                                      color: Colors.white),
                                ),
                              ),

                            ],
                          ),
                        ),
                        /// time
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'appointmentDate , widget.appointmentTime',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70),
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
                                Expanded(
                                  flex: 3,
                                  child: Container(

                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/images/background.jpg'),fit: BoxFit.fill),
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(16)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Dr.+ widget.patienSurname' ,


                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(


                                            color: Colors.black87),
                                      ),
                                      Text(

                                        'widget.patienName',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(


                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        /// bttton accept refuse
                        Expanded(

                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              RaisedButton(
                                color: Colors.amber,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),

                                ),


                                child: Text("           Update         "),

                                onPressed: null,
                              ),

                              SizedBox(width: 50),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                                child: Text("         Cancel            "),
                                onPressed: null,
                              ),
                            ],
                          ),

                        ),


                      ],
                    ),

                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Color(0xff2C8BFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ///proposition appointment
                        Expanded(
                          child: Row(

                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '                  Appointment Accepted',
                                  style: TextStyle(
                                      fontSize:20,
                                      color: Colors.white),
                                ),
                              ),

                            ],
                          ),
                        ),
                        /// time
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'appointmentDate , widget.appointmentTime',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70),
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
                                Expanded(
                                  flex: 3,
                                  child: Container(

                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/images/background.jpg'),fit: BoxFit.fill),
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(16)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Dr.+ widget.patienSurname' ,


                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(


                                            color: Colors.black87),
                                      ),
                                      Text(

                                        'widget.patienName',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(


                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        /// bttton accept refuse



                      ],
                    ),

                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(
                        color: Color(0xff2C8BFF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// appointment refused
                        Expanded(
                          child: Row(

                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '                  Appointment refused',
                                  style: TextStyle(
                                      fontSize:20,
                                      color: Colors.white),
                                ),
                              ),

                            ],
                          ),
                        ),
                        /// time
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'appointmentDate , widget.appointmentTime',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white70),
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
                                Expanded(
                                  flex: 3,
                                  child: Container(

                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/images/background.jpg'),fit: BoxFit.fill),
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(16)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Dr.+ widget.patienSurname' ,


                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(


                                            color: Colors.black87),
                                      ),
                                      Text(

                                        'widget.patienName',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(


                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        /// bttton accept refuse
                        Expanded(

                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              RaisedButton(
                                color: Colors.amber,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),

                                ),


                                child: Text("           Delete          "),

                                onPressed: null,
                              ),

                              SizedBox(width: 50),

                            ],
                          ),

                        ),


                      ],
                    ),

                  ),
                ),





              ],
            ),


        )

    );
  }

  Widget _appBar() {
    return AppBar(

      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,

      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }




}