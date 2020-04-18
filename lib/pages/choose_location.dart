import 'package:flutter/material.dart';
import 'package:worldtime/service/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kathmandu', location: 'Kathmandu'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul'),
    WorldTime(url: 'Europe/London', location: 'London'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi'),
    WorldTime(url: 'Asia/Dhaka', location: 'Bangladesh'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai'),
    WorldTime(url: 'Asia/Kuala_Lumpur', location: 'Malaysia'),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne'),
    WorldTime(url: 'Europe/Copenhagen', location: 'Copenhagen'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.green,
        elevation: 0.5,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                      locations[index].location,
                      style: TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

