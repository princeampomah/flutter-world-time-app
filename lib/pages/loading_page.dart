import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async {

    WorldTime worldTime = WorldTime(location: 'Accra', flag: 'ghana.png', url: 'Africa/Accra');
    await worldTime.getTime();

    Navigator.pushReplacementNamed(context, '/home_page', arguments: {
      'location_home' : worldTime.location,
      'time_home' : worldTime.time,
      'flag_home' : worldTime.flag,
      'isDaytime_home' : worldTime.isDaytime,
    });
  }


  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[500],
      body:  ConnectivityWidget(
        builder: (context, isOnline) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),
          SizedBox(height: 20,),
          Text("${isOnline ? '' : 'No Internet Connection'}", style: TextStyle(fontSize: 15.0, color: isOnline ? Colors.white : Colors.red),),
          SizedBox(height: 20,),
        ],
      ),
    )
    )
    );
  }
}
