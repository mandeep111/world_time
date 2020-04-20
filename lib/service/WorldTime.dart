import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.time, this.url});

  Future<void> getTime() async {
    try {
      // make request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
//      print(data);

      // get json properties
      String datetime = data['datetime'];
      print('datetime $datetime');
      String offset = data['utc_offset'].substring(1,3);
      print(offset);
      String minute = data['utc_offset'].substring(4,6);

      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(minute)));

      print(now);
      // for day or night
      isDayTime = now.hour < 19 && now.hour > 6 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = 'Some error occurred!';
    }
  }


}