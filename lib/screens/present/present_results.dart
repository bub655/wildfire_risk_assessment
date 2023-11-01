import 'package:flutter/material.dart';


class PresentResultsPage extends StatefulWidget {
  const PresentResultsPage({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.factor,
    required this.area,
    required this.humidity,
    required this.temp,
    required this.wind,

    required this.range
  });

  final double latitude;
  final double longitude;
  final int factor;
  final double area;
  final int humidity;
  final double temp;
  final double wind;
  final int range;

  @override
  State<PresentResultsPage> createState() => _PresentResultsPageState(latitude, longitude, factor, area, humidity, temp, wind, range);
}

class _PresentResultsPageState extends State<PresentResultsPage> {
  double latitude = 0.0;
  double longitude = 0.0;
  int factor = 0;
  double area = 0.0;
  int humidity = 0;
  double temp = 0.0;
  double wind = 0.0;
  int range = 0;

  _PresentResultsPageState(latitude, longitude, factor, area, humidity, temp, wind, range) {
    this.latitude = latitude;
    this.longitude = longitude;
    this.factor = factor;
    this.area = area;
    this.humidity = humidity;
    this.temp = double.parse(temp.toStringAsFixed(2));
    this.wind = double.parse(wind.toStringAsFixed(2));
    this.range = range;
  }
  var style = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  var color = Color(0xff000000);

  @override
  Widget build(BuildContext context) {
    if (factor == 0) {
      color = Color(0xff00ff00);
    } else if (factor == 1) {
      color = Color(0xff32CD32);
    } else if (factor == 2) {
      color = Color(0xff00FF7F);
    }else if (factor == 3) {
      color = Color(0xff7FFF00);
    }else if (factor == 4) {
      color = Color(0xff9ACD32);
    }else if (factor == 5) {
      color = Color(0xffFFFF00);
    } else if (factor == 6) {
      color = Color(0xffFFD700);
    }else if (factor == 7) {
      color = Color(0xffFFA500);
    }else if (factor == 8) {
      color = Color(0xffFF8C00);
    }else if (factor == 9) {
      color = Color(0xffDC143C);
    }else if (factor == 10) {
      color = Color(0xffFF0000);
    }
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(top: 44.0, bottom: 12.0),
                child: Center(
                  child: Text(
                      "Wildfire Check Results",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )
                  ),
                ),
              ),
              color: Color(0xffd9d9d9)
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Your Risk:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '${factor}/10',
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: color
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Latitude: $latitude',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(width: 10),
                      Text('Longitude: ${longitude}',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Temperature: ${temp} °C',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Wind Speed: ${wind} km/hr',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Humidity: ${humidity}%',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 48),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
                    child: Container(
                        height: 320,
                        width: 320,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image.asset(
                            'assets/images/RiskAssessment.png',
                          ),
                        )



                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
