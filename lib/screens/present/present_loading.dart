import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wildfire_risk_assessment/screens/present/present_results.dart';

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

  _DangerLoadingScreenState(country, latitude, longitude, range) {
    this._country = country;
    this._latitude = latitude;
    this._longitude = longitude;
    this._range = range;
  }

  void initState() {
    super.initState();
    getFireData(_latitude, _longitude, _range);
  }
  Future<void> getFireData(latitude, longitude, range) async {
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

    var model_response = await runModel(ffmc, dmc, dc, isi, temp, humidity, wind);
    print(model_response);
    var prediction = model_response['predictions'];
    print(prediction);
    var factor = model_response['factor'];

    route(latitude, longitude, prediction, factor, humidity, temp, wind, range);
  }

  Future runModel(ffmc, dmc, dc, isi, temp, rh, wind) async {
    final uri_model = Uri.parse("${dotenv.env['PRESENT_MODEL']}?FFMC=${ffmc}&DMC=${dmc}&DC=${dc}&ISI=${isi}&temp=${temp}&RH=${rh}&wind=${wind}");
    final response = await http.get(uri_model);
    print("CALLED RESPONSE");
    var predictions;
    if(response.statusCode == 200) {
      predictions = json.decode(response.body);
    } else {
      print("Model failed");
    }
    return predictions;
  }

  route(latitude, longitude, area, factor, humidity, temp, wind, range) {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => PresentResultsPage(latitude: latitude, longitude: longitude, factor: factor, area: area, humidity: humidity, temp: temp, wind: wind, range: range)
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        )
    );
  }
}


