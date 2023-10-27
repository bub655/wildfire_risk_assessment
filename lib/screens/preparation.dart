import 'package:flutter/material.dart';

class PreparationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Wildfire Risk Assessment"),
      ),

      body: ListView(
        children: [

          // Navigation button
          ElevatedButton(
              onPressed: () {
                // Navigation logic here
              },
              child: Text("Statistics, Present, Past")
          ),

          // Page title
          Container(
            padding: EdgeInsets.all(32),
            child: Text(
              "Preparation",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Bullet point lists
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [

                Text("- Point 1", style: TextStyle(fontSize: 18),),
                Text("- Point 2", style: TextStyle(fontSize: 18),),
                Text("- Point 3", style: TextStyle(fontSize: 18),),

              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [

                Text("- Point 4", style: TextStyle(fontSize: 18),),
                Text("- Point 5", style: TextStyle(fontSize: 18),),
                Text("- Point 6", style: TextStyle(fontSize: 18),),

              ],
            ),
          ),

        ],
      ),

    );

  }

}