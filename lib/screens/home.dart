import 'package:flutter/material.dart';
import 'package:wildfire_risk_assessment/screens/preparation.dart';
import 'package:wildfire_risk_assessment/screens/statistics.dart';
import 'package:wildfire_risk_assessment/presentation/wildfire_app_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  static List<Widget> _content = <Widget>[
    PreparationPage(),
    PreparationPage(),
    Text("bye bye"),
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
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.house_damage),
            label: 'Past Damage',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.chart_bar),
            label: 'Statistics',
          ),
        ],
        currentIndex: _index,
        selectedItemColor:  Color(0xffff0000),
        onTap: _onItemTapped,
      ),
    );
  }
}
