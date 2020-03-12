import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime(location: 'Accra', url: 'Africa/Accra', flag: 'ghana.png'),
    WorldTime(location: 'London', url: 'Europe/London', flag: 'london.jpg'),
    WorldTime(location: 'Chicago', url: 'America/Chicago', flag: 'america.jpg'),
    WorldTime(location: 'Cairo', url: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(location: 'New York', url: 'America/New_York', flag: 'america.jpg'),
    WorldTime(location: 'Johannesburg', url: 'Africa/Johannesburg', flag: 'south_africa.png'),
    WorldTime(location: 'Lagos', url: 'Africa/Lagos', flag: 'nigeria.jpg'),
    WorldTime(location: 'Cordoba', url: 'America/Argentina/Cordoba', flag: 'america.jpg'),
    WorldTime(location: 'Bangkok', url: 'Asia/Bangkok', flag: 'bangkok.jpg'),
    WorldTime(location: 'Dubai', url: 'Asia/Dubai', flag: 'dubai.png'),
    WorldTime(location: 'Berlin', url: 'Europe/Berlin', flag: 'germany.jpg'),
    WorldTime(location: 'Lisbon', url: 'Europe/Lisbon', flag: 'portugal.png'),
  ];

  void getUpdatedTime(index) async {

    WorldTime outputTime = locations[index]; //go through the list and get data from it based on the index
    await outputTime.getTime();

   Navigator.pop(context, {
     'location_home' : outputTime.location,
     'time_home' : outputTime.time,
     'flag_home' : outputTime.flag,
     'isDaytime_home' : outputTime.isDaytime,
   });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Choose a Location',
        style: TextStyle(
          color: Colors.white
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[500],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              elevation: 1.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 0.0),
                child: ListTile(
                  onTap: (){
                   getUpdatedTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/${locations[index].flag}'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

 
}
