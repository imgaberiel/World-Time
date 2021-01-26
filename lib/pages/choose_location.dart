import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpeg', country: 'UK'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png', country: 'Germany'),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag: 'ghana.png', country: 'Ghana'),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag: 'morco.jpeg', country: 'Morocco'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', country: 'Egypt'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'naija.png', country: 'Nigeria'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'nairobi.png', country: 'Kenya'),
    WorldTime(url: 'Asia/Dubai', location: 'Duabi', flag: 'dubai.jpeg', country: 'Saudi Arabia'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
      'country': instance.country
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location'),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
        itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  subtitle: Text(locations[index].country),
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}
