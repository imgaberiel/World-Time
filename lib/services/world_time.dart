import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for the UI
  String time; // the time in the location
  String flag; // url to an asset flag
  String url; // location url for API endpoint
  bool isDayTime; // day or night Time
  String country; // country name

  // creating the constructor
  WorldTime({this.location, this.flag, this.url, this.country});

  Future<void> getTime() async{

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
//    print(data);
      //get properties Time API
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
//    print(dateTime);
//    print(offset);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set day or night time
      isDayTime = now.hour > 6  && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = ('Could not Connect to Server');
    }
  }
}
