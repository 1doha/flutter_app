// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:electronic_app/shared/colors.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("About"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'About This App',
              style: TextStyle(
                color: Color.fromRGBO(78, 81, 128, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "We sell electronic products such as cameras, laptops, monitors, and wireless headphones. Each customer also has his own shopping cart and the price of each product or the price of all products.",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.birthdayMonth),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
