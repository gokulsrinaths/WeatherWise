import 'package:flutter/material.dart';
import 'weather_api_service.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _controller = TextEditingController();
  String _weatherInfo = '';
  String _imagePath = '';
  String _temperatureDescription = '';
  String _weatherSuggestion = '';
  bool _resultsFetched = false;

  void _fetchWeather() async {
    try {
      final weatherData =
          await WeatherApiService().getWeather(_controller.text);
      final double temp = weatherData['current']['temp_c'];
      setState(() {
        _weatherInfo = '$temp °C';
        _setImageAndDescription(temp);
        _resultsFetched = true;
      });
    } catch (e) {
      setState(() {
        _weatherInfo = 'Failed to load weather data';
        _imagePath = '';
        _temperatureDescription = '';
        _weatherSuggestion = '';
        _resultsFetched = false;
      });
    }
  }

  void _setImageAndDescription(double temp) {
    if (temp < -20) {
      _imagePath = 'weatherwise/assets/extremely_cold.png';
      _temperatureDescription = 'Extremely Cold';
      _weatherSuggestion = "It's freezing outside. Stay warm and bundled up!";
    } else if (temp < -10) {
      _imagePath = 'assets/very_cold.png';
      _temperatureDescription = 'Very Cold';
      _weatherSuggestion = "Remember to wear heavy winter clothing!";
    } else if (temp < 0) {
      _imagePath = 'assets/cold.png';
      _temperatureDescription = 'Cold';
      _weatherSuggestion = "Keep yourself cozy with a warm jacket.";
    } else if (temp < 10) {
      _imagePath = 'assets/mild.png';
      _temperatureDescription = 'Mild';
      _weatherSuggestion = "A light sweater should be enough.";
    } else if (temp < 20) {
      _imagePath = 'assets/warm.png';
      _temperatureDescription = 'Warm';
      _weatherSuggestion = "Nice weather for outdoor activities!";
    } else if (temp < 30) {
      _imagePath = 'assets/hot.png';
      _temperatureDescription = 'Hot';
      _weatherSuggestion = "Stay hydrated and wear light clothing.";
    } else {
      _imagePath = 'assets/extremely_hot.png';
      _temperatureDescription = 'Extremely Hot';
      _weatherSuggestion =
          "It's scorching outside! Best to stay indoors or in shade.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Page'),
        backgroundColor: Colors.blue, // Set the app bar background color
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
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/WeatherLogo.png',
                        width: 150, height: 150),
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
                          onPressed: _fetchWeather,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (_weatherInfo.isNotEmpty) ...[
                      Text(
                        _weatherInfo,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(_imagePath, width: 100, height: 100),
                      SizedBox(height: 8),
                      Text(
                        _temperatureDescription,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _weatherSuggestion,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                    ],
                    if (_resultsFetched) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/clothing');
                            },
                            child: Text('Clothing',
                                style: TextStyle(color: Colors.blue)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/food');
                            },
                            child: Text('Food',
                                style: TextStyle(color: Colors.blue)),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
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
