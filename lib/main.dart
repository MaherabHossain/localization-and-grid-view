import 'package:flutter/material.dart';
import 'package:myvideos/screens/country-name/country_view.dart';
import 'package:myvideos/screens/localization/localization_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Task 1 button pressed
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LocalizationView()));
              },
              child: Text('Task 1'),
            ),
            SizedBox(height: 16), // Add spacing between the buttons
            ElevatedButton(
              onPressed: () {
                // Task 2 button pressed
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryName()));
              },
              child: Text('Task 2'),
            ),
          ],
        ),
      ),
    );
  }
}
