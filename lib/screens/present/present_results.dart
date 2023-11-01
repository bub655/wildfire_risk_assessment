import 'package:flutter/material.dart';

class PresentResultsPage extends StatefulWidget {
  const PresentResultsPage({
    super.key,
    required this.country,
    required this.state,
    required this.city,
    required this.range
  });

  final String country;
  final String state;
  final String city;
  final int range;

  @override
  State<PresentResultsPage> createState() => _PresentResultsPageState();
}

class _PresentResultsPageState extends State<PresentResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Text("woahoh s");
  }
}
