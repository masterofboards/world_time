import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: "Europe/London", location: 'London', flag: 'uk.png'),
    WorldTime(url: "Europe/Berlin", location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: "Africa/Cairo", location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: "Africa/Nairobi", location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: "America/Chicago", location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: "America/New_York", location: 'New York', flag: 'usa.png'),
    WorldTime(url: "Asia/Jakarta", location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
