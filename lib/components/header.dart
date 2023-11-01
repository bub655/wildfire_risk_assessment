import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Wildfire Danger Check",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        )
      ),
    );
  }
}
