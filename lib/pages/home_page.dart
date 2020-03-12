import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map getData = {};

  @override
  Widget build(BuildContext context) {

    //check if the data is empty or not
    getData = getData.isNotEmpty ? getData : ModalRoute.of(context).settings.arguments; //get the data from the loading page as map
//    print(getData);

    String bgImage = getData['isDaytime_home'] ? 'assets/images/daytime.jpg' : 'assets/images/night.jpg';
    Color bgColor = getData['isDaytime_home'] ? Colors.blue[100] : Colors.black54;
    String Day_Night = getData['isDaytime_home'] ? 'day time' : 'night time'; //if it's daytime show 'day time' or otherwise
    Color txtColor = getData['isDaytime_home'] ? Colors.white70 : Colors.white; //if it's daytime text colors should be blue or otherwise

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 100, 0.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton.icon(
                    splashColor: Colors.blue,
                    autofocus: true,
                    onPressed: () async {
                      //wait till it gets function in the choose location finish
                     dynamic result = await Navigator.pushNamed(context, '/choose_location_page');
                     setState(() { //rebuild the BuildContext, hence will override the getData instance if it's not empty
                       getData = {
                          'location_home' : result['location_home'],
                          'time_home' : result['time_home'],
                          'flag_home' : result['flag_home'],
                          'isDaytime_home' : result['isDaytime_home'],
                       };
                     });
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Choose Location',
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 15.0,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        getData['location_home'],
                        style: TextStyle(
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                          color: txtColor,
                        ),
                      ),
                      SizedBox(width: 15.0,),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/${getData['flag_home']}'),
                          radius: 10.0,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    getData['time_home'],
                    style: TextStyle(
                      fontSize: 57.0,
                      color: txtColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    Day_Night,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: txtColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
