import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DangerLoadingScreen extends StatefulWidget {
  final String country;
  final double latitude;
  final double longitude;
  final int range;


  DangerLoadingScreen({
    super.key,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.range
  });
  @override
  State<DangerLoadingScreen> createState() => _DangerLoadingScreenState(country, latitude, longitude, range);
}

class _DangerLoadingScreenState extends State<DangerLoadingScreen> {

  String _country = "hello";
  double _latitude = 0;
  double _longitude = 0;
  int _range = 50;
  String _key = dotenv.get('TRIAL', fallback:"");

  _DangerLoadingScreenState(country, latitude, longitude, range) {
    print(latitude);
    this._country = country;
    this._latitude = latitude;
    this._longitude = longitude;
    this._range = range;
  }

  void initState() {
    super.initState();
    getFireData(_latitude, _longitude);
  }
  Future<void> getFireData(latitude, longitude) async {
    final uri_smhi = Uri.parse("https://opendata-download-metanalys.smhi.se/api/category/fwia1g/version/1/daily/geotype/point/lon/${longitude}/lat/${latitude}/data.json");
    final response_smhi = await http.get(uri_smhi);

    final uri_openweather = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${dotenv.env['OPEN_WEATHER_KEY']}");
    final response_weather = await http.get(uri_openweather);

    double ffmc = 0;
    double dmc = 0;
    double dc = 0;
    double isi = 0;
    var fire_json;

    if (response_smhi.statusCode == 200) {
      fire_json = json.decode(response_smhi.body);
    } else {
      print("Latitude and longitude are not in correct range");
    }

    fire_json = fire_json['timeSeries'][0]['parameters'];
    for (var element in fire_json) {
      if(element['name'] == "ffmc") {
        ffmc = element['values'][0];
      }
      if (element['name'] == "dmc") {
        dmc = element['values'][0];
      }
      if (element['name'] == "dc") {
        dc = element['values'][0];
      }
      if (element['name'] == "isi") {
        isi = element['values'][0];
      }
    }


    double air = 0;
    var weather_json;

    if (response_weather.statusCode == 200) {
      weather_json = json.decode(response_weather.body);
    } else {
      print("Latitude and longitude are not in correct range");
    }
    print(weather_json);

    int humidity = weather_json['main']['humidity'];
    double temp = weather_json['main']['temp'] - 273.15;
    double wind = weather_json['wind']['speed']*3.6;
    //double rain = weather_json['hourly']['rain'];


    print("API VALUES");
    print(humidity.toString());
    // print(rain.toString());
    print(wind.toString());
    print(temp);



  }


  @override
  Widget build(BuildContext context) {
    print(dotenv.get('TRIAL', fallback:""));
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text("Loading...", style: TextStyle(fontSize: 18)),
              Text(_country),
              Text(_latitude.toString()),

            ],
          ),
        )
    );
  }
}


