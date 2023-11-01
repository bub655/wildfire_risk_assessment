import 'package:flutter/material.dart';


class WildfireStatistic extends StatefulWidget {
  final String wildfireName;
  final String acresBurned;
  final String counties;
  final String started;
  final String extinguished;
  final String injuries;
  final String fatalities;
  final String percentContained;
  final String structuresDamaged;
  final String structuresDestroyed;
  final String structuresEvacuated;
  final String searchDescription;
  final double latitude;
  final double longitude;

  const WildfireStatistic({
    super.key,
    required this.wildfireName,
    required this.acresBurned,
    required this.counties,
    required this.started,
    required this.extinguished,
    required this.injuries,
    required this.fatalities,
    required this.percentContained,
    required this.structuresDamaged,
    required this.structuresDestroyed,
    required this.structuresEvacuated,
    required this.searchDescription,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<WildfireStatistic> createState() => _WildfireStatisticState(wildfireName, acresBurned, counties, started, extinguished, injuries, fatalities, percentContained, structuresDamaged, structuresDestroyed, structuresEvacuated, searchDescription, latitude, longitude);
}

class _WildfireStatisticState extends State<WildfireStatistic> {
  String wildfireName = "";
  String acresBurned = "N/A";
  String counties = "N/A";
  String started = "N/A";
  String extinguished = "N/A";
  String injuries = "N/A";
  String fatalities = "N/A";
  String percentContained = "N/A";
  String structuresDamaged = "N/A";
  String structuresDestroyed = "N/A";
  String structuresEvacuated = "N/A";
  String searchDescription = "N/A";
  double latitude = 0.0;
  double longitude = 0.0;

  _WildfireStatisticState(wildfireName, acresBurned, counties, started, extinguished, injuries, fatalities, percentContained, structuresDamaged, structuresDestroyed, structuresEvacuated, searchDescription, latitude, longitude) {
    this.wildfireName = wildfireName;
    this.acresBurned = acresBurned;
    this.counties = counties;
    this.started = started;
    this.extinguished = extinguished;
    this.injuries = injuries;
    this.fatalities = fatalities;
    this.percentContained = percentContained;
    this.structuresDamaged = structuresDamaged;
    this.structuresDestroyed = structuresDestroyed;
    this.structuresEvacuated = structuresEvacuated;
    this.searchDescription = searchDescription;
    this.latitude = latitude;
    this.longitude = longitude;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(top: 44.0, bottom: 12.0),
                child: Column(
                  children: [
                    
                    Text(
                      wildfireName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      )
                    ),

                  ]
                ),
              ),
              color: Color(0xffd9d9d9)
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10.0),
                Center(child: Text(
                    searchDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                )),
                SizedBox(height: 20.0),
                Text('Sizes: ${acresBurned} acres',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14
                )),
                SizedBox(height: 10.0),
                Text('County: ${counties}'),
                SizedBox(height: 10.0),
                Text('Started: ${started}'),
                SizedBox(height: 10.0),
                Text('Extinguished: ${extinguished}'),
                SizedBox(height: 10.0),
                Text('Injuries: ${injuries}'),
                SizedBox(height: 10.0),
                Text('Fatalities: ${fatalities}'),
                SizedBox(height: 10.0),
                Text('Percent Contained: ${percentContained}'),
                SizedBox(height: 10.0),
                Text('Structures Damaged: ${structuresDamaged}'),
                SizedBox(height: 10.0),
                Text('Structures Destroyed: ${structuresDestroyed}'),
                SizedBox(height: 10.0),
                Text('Structures Evacuated: ${structuresEvacuated}'),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
