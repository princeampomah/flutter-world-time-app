import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String time;
  String location;
  String flag;
  String url;
  bool isDaytime;


  WorldTime({this.location, this.flag, this.url});


  Future<void> getTime() async {

    try{

      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);


        String date = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);
//    print(date);
//    print(offset);

        //create DateTime object
        DateTime dateTime = DateTime.parse(date); //parse date to DateTime() for it to be in actual date instead of map
        dateTime = dateTime.add(Duration(hours: int.parse(offset))); //added the offset to the dateTime

        //set the time property
        isDaytime = dateTime.hour >= 6 && dateTime.hour <= 17 ? true : false;
        time = DateFormat.jm().format(dateTime);



    }
    catch(e){
      print('An error has occured : $e');
      time = 'could not load time';
    }


  }
}
