import 'package:flutter/material.dart';
import 'package:wildfire_risk_assessment/screens/preparation.dart';
import 'package:wildfire_risk_assessment/screens/present/present.dart';
import 'package:wildfire_risk_assessment/screens/statistics/statistics.dart';
import 'package:wildfire_risk_assessment/presentation/wildfire_app_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 2;

  static List<Widget> _content = <Widget>[
    PreparationPage(),
    PresentPage(),
    StatsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _content.elementAt(_index)
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffd9d9d9),
        unselectedItemColor: Color(0xff000000),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.info),
            label: 'Preparation',
            backgroundColor: Color(0xffd9d9d9)
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.fire),
            label: 'Wildfire Risk',
            backgroundColor: Color(0xffd9d9d9)
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.chart_bar),
            label: 'Statistics',
            backgroundColor: Color(0xffd9d9d9)
          ),
        ],
        currentIndex: _index,
        selectedItemColor:  Color(0xffff0000),
        onTap: _onItemTapped,
      ),
    );
  }
}
