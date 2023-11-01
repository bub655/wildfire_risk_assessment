import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:wildfire_risk_assessment/screens/present/present_loading.dart';
import 'package:wildfire_risk_assessment/screens/present/present_results.dart';
import 'package:flutter/services.dart';

class PresentPage extends StatefulWidget {
  const PresentPage({super.key});

  @override
  State<PresentPage> createState() => _PresentPageState();
}

class _PresentPageState extends State<PresentPage> {
  @override

  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final countryController = TextEditingController();
  double latitude = 0.0;
  double longitude = 0.0;
  String country = "";
  int range = 0;
  int _range = 50;

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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 36, horizontal: 64),
                child: Text(
                    "Location input to find current risk of wildfire",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                          "Latitude",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                          )
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,6}'))],
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),

                            filled: true, //<-- SEE HERE
                            fillColor: Color(0xffd9d9d9),
                          ),
                          controller: latitudeController,
                        ),
                      )
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                          "Longitude",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                          )
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,6}'))],
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),

                            filled: true, //<-- SEE HERE
                            fillColor: Color(0xffd9d9d9),
                          ),
                          controller: longitudeController,
                        ),
                      )
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                          "Range",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                          )
                      ),
                      SizedBox(height: 8),
                      NumberPicker(
                        value: _range,
                        axis: Axis.horizontal,
                        minValue: 0,
                        maxValue: 100,
                        step: 25,
                        selectedTextStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                        onChanged: (value) => setState(() => _range = value),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 140,
                child: Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xffd9d9d9)
                  ),
                  child: TextButton(
                    onPressed: () {
                      print('longitudeController;'+ longitudeController.text);
                      country = countryController.text;
                      try{
                        longitude = double.parse(longitudeController.text);
                      } catch (e) {
                        longitude = 0.0;
                      };
                      try{
                        latitude = double.parse(latitudeController.text);
                      } catch (e) {
                        latitude = 0.0;
                      };
                      range = _range;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DangerLoadingScreen(country: country, latitude: latitude, longitude: longitude, range: range)),
                      );
                    },
                    style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                    ),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                              "Submit",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                    )
                  ),
                ),
              ),
            ]
        )
    );
  }
}
