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
  State<PresentResultsPage> createState() => _PresentResultsPageState();
}

class _PresentResultsPageState extends State<PresentResultsPage> {
  var style = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(top: 44.0),
                child: Center(
                  child: Text(
                      "Wildfire Danger Check",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )
                  ),
                ),
              ),
              color: Color(0xffd9d9d9)
            ),
            Text('FFMC', style:style),
          ],
        )
    );
  }
}
