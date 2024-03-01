import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Ha Noi', flag: 'vietnam.jpg', url: 'Asia/Ho_Chi_Minh'),
    WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'New York', flag: 'America.png', url: 'America/New_York'),
    WorldTime(location: 'Tokyo', flag: 'Japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Seoul', flag: 'korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Buenos Aires', flag: 'Argentina.png', url: 'America/Argentina/Buenos_Aires'),
    WorldTime(location: 'Lisbon', flag: 'Portugal.png', url: 'Europe/Lisbon'),
    WorldTime(location: 'Rome', flag: 'italia.png', url: 'Europe/Rome'),
    WorldTime(location: 'Madrid', flag: 'Spain.png', url: 'Europe/Madrid'),
    WorldTime(location: 'Doha', flag: 'qatar.png', url: 'Asia/Qatar'),
    WorldTime(location: 'Cairo', flag: 'Egypt.png', url: 'Africa/Cairo'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
