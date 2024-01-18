import 'package:flutter/material.dart';
import 'dart:math';
import 'weather_api_service.dart';

class FoodSuggestionPage extends StatefulWidget {
  @override
  _FoodSuggestionPageState createState() => _FoodSuggestionPageState();
}

class _FoodSuggestionPageState extends State<FoodSuggestionPage> {
  final TextEditingController _controller = TextEditingController();
  String _foodSuggestion = '';
  String _timeOfDay = '';
  final _random = Random();
  List<Map<String, dynamic>> _foodOptions = [];
  bool _resultsFetched = false;
  String _foodImage = 'assets/WeatherLogo.png';

  void _fetchWeatherAndSuggestFood() async {
    try {
      final weatherData =
          await WeatherApiService().getWeather(_controller.text);
      final double temp = weatherData['current']['temp_c'];
      final time = DateTime.now();
      setState(() {
        _timeOfDay = _getTimeOfDayGreeting(time);
        _foodOptions = _getFoodOptions(temp);
        final randomFood = _getRandomFood(_foodOptions);
        _foodSuggestion = randomFood['dish'];
        _foodImage = randomFood['image'];
        _resultsFetched = true;
      });
    } catch (e) {
      setState(() {
        _foodSuggestion = 'Failed to load weather data';
        _resultsFetched = false;
        _foodImage = 'assets/WeatherLogo.png'; // Handle the default image
      });
    }
  }

  String _getTimeOfDayGreeting(DateTime time) {
    if (time.hour < 12) {
      return 'Good Morning';
    } else if (time.hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  List<Map<String, dynamic>> _getFoodOptions(double temp) {
    if (temp < -10) {
      return [
        {'dish': 'Warm porridge', 'image': 'assets/porridge_image.png'},
        {'dish': 'Hearty stew', 'image': 'assets/stew_image.png'},
        {
          'dish': 'Spaghetti Carbonara',
          'image': 'assets/spaghetti_carbonara.png'
        },
      ];
    } else if (temp < 0) {
      return [
        {'dish': 'Porridge', 'image': 'assets/porridge_image.png'},
        {'dish': 'Stew', 'image': 'assets/stew_image.png'},
        {
          'dish': 'Spaghetti Carbonara',
          'image': 'assets/spaghetti_carbonara.png'
        },
      ];
    } else if (temp < 10) {
      return [
        {'dish': 'Pastry', 'image': 'assets/pastry_image.png'},
        {'dish': 'Pizza', 'image': 'assets/pizza_image.png'},
        {'dish': 'Burger', 'image': 'assets/burger_image.png'},
        {'dish': 'Caesar Salad', 'image': 'assets/caesar_salad.png'},
        {'dish': 'BLT Sandwich', 'image': 'assets/blt_sandwich.png'},
      ];
    } else if (temp < 20) {
      return [
        {'dish': 'Sushi', 'image': 'assets/sushi_image.png'},
        {'dish': 'Grilled Chicken', 'image': 'assets/chicken_image.png'},
        {'dish': 'Tacos', 'image': 'assets/tacos_image.png'},
        {'dish': 'Burrito', 'image': 'assets/burrito_image.png'},
        {'dish': 'Pasta Salad', 'image': 'assets/pasta_salad_image.png'},
        {'dish': 'Greek Gyros', 'image': 'assets/gyros_image.png'},
        {'dish': 'California Roll', 'image': 'assets/california_roll.png'},
        {'dish': 'Barbecue Chicken', 'image': 'assets/barbecue_chicken.png'},
        {'dish': 'Cobb Salad', 'image': 'assets/cobb_salad.png'},
      ];
    } else {
      return [
        {'dish': 'Smoothie bowl', 'image': 'assets/smoothie_image.png'},
        {'dish': 'Fruit salad', 'image': 'assets/fruit_salad_image.png'},
        {'dish': 'Ice Cream', 'image': 'assets/ice_cream_image.png'},
        {'dish': 'Cold Salad', 'image': 'assets/cold_salad_image.png'},
        {'dish': 'Gazpacho', 'image': 'assets/gazpacho_image.png'},
        {'dish': 'Hawaiian Poke Bowl', 'image': 'assets/poke_bowl_image.png'},
        {'dish': 'Mango Lassi', 'image': 'assets/mango_lassi_image.png'},
        {'dish': 'Tropical Smoothie', 'image': 'assets/tropical_smoothie.png'},
        {
          'dish': 'Mint Chocolate Chip Ice Cream',
          'image': 'assets/mint_chocolate_chip_ice_cream.png'
        },
        {'dish': 'Cucumber Salad', 'image': 'assets/cucumber_salad.png'},
      ];
    }
  }

  Map<String, dynamic> _getRandomFood(List<Map<String, dynamic>> foodOptions) {
    if (foodOptions.isNotEmpty) {
      return foodOptions[_random.nextInt(foodOptions.length)];
    } else {
      return {
        'dish': 'No options available',
        'image': 'assets/WeatherLogo.png'
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Suggestion'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.lightBlue.shade200, Colors.blue.shade600],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset(
              'assets/WeatherLogo.png', // Add your food logo image path here
              width: 150,
              height: 150,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Enter City Name',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: _fetchWeatherAndSuggestFood,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (_foodSuggestion.isNotEmpty) ...[
                      Text(
                        '$_timeOfDay! Based on the current temperature, you might enjoy:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        _foodSuggestion,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      if (_resultsFetched) ...[
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              final randomFood = _getRandomFood(_foodOptions);
                              _foodSuggestion = randomFood['dish'];
                              _foodImage = randomFood['image'];
                            });
                          },
                          child: Text('Randomize',
                              style: TextStyle(color: Colors.blue)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                        ),
                      ],
                    ],
                    SizedBox(height: 20),
                    Image.asset(
                      _foodImage, // Display the food image here
                      width: 150,
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
