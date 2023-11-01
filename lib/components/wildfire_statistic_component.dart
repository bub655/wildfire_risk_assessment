import 'package:flutter/material.dart';
import 'package:wildfire_risk_assessment/screens/statistics/wildfireDetails.dart';

class StatisticComponent extends StatelessWidget {
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

  const StatisticComponent({
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => WildfireStatistic(wildfireName: wildfireName, acresBurned: acresBurned, counties: counties, started: started, extinguished: extinguished, injuries: injuries, fatalities: fatalities, percentContained:percentContained, structuresDamaged: structuresDamaged, structuresDestroyed: structuresDestroyed, structuresEvacuated: structuresEvacuated, searchDescription: searchDescription, latitude: latitude, longitude: longitude)
        )
        );
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(bottom: 20.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                wildfireName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Size: ${acresBurned}'),
              Text('County: ${counties}'),
              Text('Started: ${started}'),
            ],
          ),
        ),
      ),
    );
  }
}
