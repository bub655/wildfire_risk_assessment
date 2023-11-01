import 'package:flutter/material.dart';
import 'package:wildfire_risk_assessment/screens/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wildfire_risk_assessment/screens/statistics/statistics.dart';

void main()async {

  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: HomeScreen(),
    );
  }
}