import 'package:flutter/material.dart';
import 'logo_screen.dart'; // Make sure this file is named 'logo_screen.dart' and contains the LogoScreen class.
import 'package:weatherwise/home_screen.dart'; // Make sure this file is named 'home_screen.dart' and contains the HomeScreen class.
import 'package:weatherwise/weather_page.dart'; // Make sure this file is named 'weather_page.dart' and contains the WeatherPage class.
import 'package:weatherwise/FoodSuggestionPage.dart'; // Make sure this file is named 'weather_page.dart' and contains the WeatherPage class.
import 'package:weatherwise/ClothingSuggestionPage.dart';
import 'package:weatherwise/FAQ.dart';
import 'package:weatherwise/about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LogoScreen(),
        '/home': (context) => HomeScreen(),
        '/weather': (context) => WeatherPage(),
        '/food': (context) => FoodSuggestionPage(),
        '/clothing': (context) => ClothingSuggestionPage(),
        '/FAQ': (context) => FAQPage(),
        '/about': (context) => AboutMePage(),

        // Add other routes here if necessary
      },
    );
  }
}
