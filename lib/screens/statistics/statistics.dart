import 'package:flutter/material.dart';
import 'package:wildfire_risk_assessment/components/wildfire_statistic_component.dart';
import 'package:wildfire_risk_assessment/screens/home.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  List _items = [];

  @override
  void initState() {

    super.initState();
    readJson();
  }
// Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/converted.json');
    print(response);
    final data = await json.decode(response);
    setState(() {
      _items = data["features"];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items.isNotEmpty
          ? Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 44.0, bottom: 12.0),
                    child: Center(
                      child: Text(
                          "Statistics",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          )
                      ),
                    ),
                  ),
                  color: Color(0xffd9d9d9)
              ),
              Expanded(
                child: Container(
                  color: Color(0xffeaeaea),
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: StatisticComponent(
                              wildfireName: _items[index]['properties']['Name'],
                              acresBurned: _items[index]['properties']['AcresBurned'].toString(),
                              counties: _items[index]['properties']['Counties'].toString(),
                              started: _items[index]['properties']['Started'].toString(),
                              extinguished: _items[index]['properties']['Extinguished'].toString(),
                              injuries: _items[index]['properties']['Injuries'].toString(),
                              fatalities: _items[index]['properties']['Fatalities'].toString(),
                              percentContained: _items[index]['properties']['PercentContained'].toString(),
                              structuresDamaged: _items[index]['properties']['StructuresDamaged'].toString(),
                              structuresDestroyed: _items[index]['properties']['StructuresDestroyed'].toString(),
                              structuresEvacuated: _items[index]['properties']['StructuresEvacuated'].toString(),
                              searchDescription: _items[index]['properties']['SearchDescription'],
                              latitude: (_items[index]['geometry']['coordinates'][1])/1.0,
                              longitude: (_items[index]['geometry']['coordinates'][0])/1.0,
                            ),
                          );
                        },
                      ),
                ),
              ),
            ],
          )
          : Container(child:Center(child:Text("check")))
    );
  }
}
