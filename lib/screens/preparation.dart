import 'package:flutter/material.dart';

class PreparationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 44.0, bottom: 12.0),
                      child: Center(
                        child: Text(
                            "Preparation",
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
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wildfires displace thousands of civilians each year. Due to their unpredictability, it is vital that families plan ahead for the scenario of a wildfire. This page will include valuable resources, tips, and checklists that are essential for wildfire preparedness.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "National Emergency Hotline - 911",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 1,
                        indent: 0,
                        color: Colors.black,
                      ),
                      SizedBox(height: 10),
                      SectionCard("Evacuation Route",
                          "In the case of an emergency, make sure a primary and secondary meeting spot outside of the house are agreed upon. They should be easily accessible and away from objects fire could spread to."),
                      SectionCard("Evacuation Checklist and Preparedness Kit",
                          "- Water and non-perishable food items\n- Documents (identification, insurance papers, birth certificates, medical records)\n- First Aid Supplies, Prescriptions, Medications\n- Money & Credit Cards\n- Several days’ worth of clothing\n- Devices and Chargers"),
                      SectionCard("FAQ",
                          "Q: What should I do if I'm caught in a wildfire?\n- Stay calm and don't panic\n- If evacuation isn't possible, find a sheltered location away from combustible materials\n- Cover your mouth and nose with a cloth to protect against smoke\n- Call 911 or emergency services to report your location\n\nQ: How can I protect my home from wildfires?\n- Create defensible space by clearing vegetation and flammable materials\n- Use fire-resistant building materials for roofing, siding, and windows\n- Install spark arresters on chimneys and vents\n- Have a hose and firefighting tools readily available"),
                    ],
                  ),
                ),
              ],
            ),
          ),

    );

  }

}


class SectionCard extends StatelessWidget {
  final String title;
  final String content;

  SectionCard(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.only(bottom: 20.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}