import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me & The App'),
        backgroundColor: Colors.blue, // Set the app bar background color
      ),
      body: Container(
        width: double.infinity, // Set width to fill the entire screen width
        height: double.infinity, // Set height to fill the entire screen height
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.lightBlue.shade200, Colors.blue.shade600],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/WeatherLogo.png', // Replace with your logo image path
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Name: Gokul Srinath Seetha ram',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color
                ),
              ),
              Text(
                'Status: Graduate Student',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color
                ),
              ),
              Text(
                'Major: Computer Science',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color
                ),
              ),
              SizedBox(height: 24),
              Text(
                'The App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color
                ),
              ),
              SizedBox(height: 8),
              Text(
                'App Name: WeatherWise Essentials',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color
                ),
              ),
              Text(
                'Description: WeatherWise streamlines daily planning by offering weather-appropriate clothing and meal suggestions, along with road safety alerts. Users get a personalized daily assistant that not only helps them dress and eat according to the weather but also keeps them safe with real-time road risk assessments.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Set the text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
