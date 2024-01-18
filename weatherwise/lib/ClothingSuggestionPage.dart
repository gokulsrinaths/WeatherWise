import 'package:flutter/material.dart';
import 'dart:math';

class ClothingSuggestionPage extends StatefulWidget {
  @override
  _ClothingSuggestionPageState createState() => _ClothingSuggestionPageState();
}

class _ClothingSuggestionPageState extends State<ClothingSuggestionPage> {
  final TextEditingController _controller = TextEditingController();
  String _upperBodySuggestion = '';
  String _lowerBodySuggestion = '';
  String _shoesSuggestion = '';
  String _timeOfDay = '';
  final _random = Random();
  List<ClothingItem> _maleUpperBodyOptions = [];
  List<ClothingItem> _maleLowerBodyOptions = [];
  List<ClothingItem> _maleShoesOptions = [];
  List<ClothingItem> _femaleUpperBodyOptions = [];
  List<ClothingItem> _femaleLowerBodyOptions = [];
  List<ClothingItem> _femaleShoesOptions = [];
  bool _resultsFetched = false;
  bool _showMale = true; // Track whether to show male suggestions

  void _fetchWeatherAndSuggestClothing() async {
    // Simulate fetching weather data
    await Future.delayed(Duration(seconds: 2));

    final double temp = _random.nextDouble() * 30; // Random temperature
    final time = DateTime.now();
    setState(() {
      _timeOfDay = _getTimeOfDayGreeting(time);
      _resultsFetched = true;
      if (_showMale) {
        _maleUpperBodyOptions = _getMaleUpperBodyOptions(temp);
        _maleLowerBodyOptions = _getMaleLowerBodyOptions(temp);
        _maleShoesOptions = _getMaleShoesOptions(temp);
        _upperBodySuggestion = _getRandomClothing(_maleUpperBodyOptions);
        _lowerBodySuggestion = _getRandomClothing(_maleLowerBodyOptions);
        _shoesSuggestion = _getRandomClothing(_maleShoesOptions);
      } else {
        _femaleUpperBodyOptions = _getFemaleUpperBodyOptions(temp);
        _femaleLowerBodyOptions = _getFemaleLowerBodyOptions(temp);
        _femaleShoesOptions = _getFemaleShoesOptions(temp);
        _upperBodySuggestion = _getRandomClothing(_femaleUpperBodyOptions);
        _lowerBodySuggestion = _getRandomClothing(_femaleLowerBodyOptions);
        _shoesSuggestion = _getRandomClothing(_femaleShoesOptions);
      }
    });
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

  List<ClothingItem> _getMaleUpperBodyOptions(double temp) {
    // Define male upper body clothing options based on the temperature
    if (temp < 0) {
      return [
        ClothingItem('Heavy Coat', ''),
        ClothingItem('Thick Sweater', ''),
        ClothingItem('Jacket', ''),
      ];
    } else if (temp < 20) {
      return [
        ClothingItem('Long-sleeve Shirt', ''),
        ClothingItem('Light Sweater', ''),
        ClothingItem('Flannel Shirt', ''),
      ];
    } else {
      return [
        ClothingItem('T-shirt', ''),
        ClothingItem('Polo Shirt', ''),
      ];
    }
  }

  List<ClothingItem> _getMaleLowerBodyOptions(double temp) {
    // Define male lower body clothing options based on the temperature
    if (temp < 0) {
      return [
        ClothingItem('Thick Pants', ''),
        ClothingItem('Snow Pants', ''),
        ClothingItem('Jeans', ''),
      ];
    } else if (temp < 20) {
      return [
        ClothingItem('Jeans', ''),
        ClothingItem('Trousers', ''),
        ClothingItem('Corduroy Pants', ''),
      ];
    } else {
      return [
        ClothingItem('Shorts', ''),
        ClothingItem('Cargo Shorts', ''),
        ClothingItem('Khaki Shorts', ''),
      ];
    }
  }

  List<ClothingItem> _getMaleShoesOptions(double temp) {
    // Define male shoes options based on the temperature
    if (temp < 0) {
      return [
        ClothingItem('Winter Boots', ''),
        ClothingItem('Snow Boots', ''),
        ClothingItem('Leather Boots', ''),
      ];
    } else if (temp < 20) {
      return [
        ClothingItem('Closed Shoes', ''),
        ClothingItem('Sneakers', ''),
        ClothingItem('Dress Shoes', ''),
      ];
    } else {
      return [
        ClothingItem('Sandals', ''),
        ClothingItem('Flip-flops', ''),
        ClothingItem('Canvas Shoes', ''),
      ];
    }
  }

  List<ClothingItem> _getFemaleUpperBodyOptions(double temp) {
    // Define female upper body clothing options based on the temperature
    if (temp < 0) {
      return [
        ClothingItem('Heavy Coat', ''),
        ClothingItem('Thick Sweater', ''),
        ClothingItem('Jacket', ''),
      ];
    } else if (temp < 20) {
      return [
        ClothingItem('Long-sleeve Shirt', ''),
        ClothingItem('Light Sweater', ''),
        ClothingItem('Blouse', ''),
      ];
    } else {
      return [
        ClothingItem('T-shirt', ''),
        ClothingItem('Tank Top', ''),
      ];
    }
  }

  List<ClothingItem> _getFemaleLowerBodyOptions(double temp) {
    // Define female lower body clothing options based on the temperature
    if (temp < 0) {
      return [
        ClothingItem('Thick Pants', ''),
        ClothingItem('Snow Pants', ''),
        ClothingItem('Jeans', ''),
      ];
    } else if (temp < 20) {
      return [
        ClothingItem('Jeans', ''),
        ClothingItem('Trousers', ''),
        ClothingItem('Skirt', ''),
      ];
    } else {
      return [
        ClothingItem('Shorts', ''),
        ClothingItem('Cropped Pants', ''),
        ClothingItem('Leggings', ''),
      ];
    }
  }

  List<ClothingItem> _getFemaleShoesOptions(double temp) {
    // Define female shoes options based on the temperature
    if (temp < 0) {
      return [
        ClothingItem('Winter Boots', ''),
        ClothingItem('Snow Boots', ''),
        ClothingItem('Leather Boots', ''),
      ];
    } else if (temp < 20) {
      return [
        ClothingItem('Closed Shoes', ''),
        ClothingItem('Sneakers', ''),
        ClothingItem('Ballet Flats', ''),
      ];
    } else {
      return [
        ClothingItem('Sandals', ''),
        ClothingItem('Flip-flops', ''),
        ClothingItem('Canvas Shoes', ''),
      ];
    }
  }

  String _getRandomClothing(List<ClothingItem> clothingOptions) {
    if (clothingOptions.isNotEmpty) {
      final randomClothing =
          clothingOptions[_random.nextInt(clothingOptions.length)];
      return randomClothing.name;
    } else {
      return 'No options available'; // Or some other default/fallback text
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing Suggestion'),
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
            Image.asset('assets/WeatherLogo.png', width: 150, height: 150),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Enter City Name',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: _fetchWeatherAndSuggestClothing,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () => _toggleGender(true),
                          child: Text('Male',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            primary: _showMale ? Colors.blue : Colors.grey,
                          ),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () => _toggleGender(false),
                          child: Text('Female',
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            primary: !_showMale ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    if (_showMale) ...[
                      if (_maleUpperBodyOptions.isNotEmpty) ...[
                        Text(
                          '$_timeOfDay! Here are male clothing suggestions based on the current temperature:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Upper Body: $_upperBodySuggestion',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Lower Body: $_lowerBodySuggestion',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Shoes: $_shoesSuggestion',
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
                                _upperBodySuggestion =
                                    _getRandomClothing(_maleUpperBodyOptions);
                                _lowerBodySuggestion =
                                    _getRandomClothing(_maleLowerBodyOptions);
                                _shoesSuggestion =
                                    _getRandomClothing(_maleShoesOptions);
                              });
                            },
                            child: Text('Get New Suggestions',
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 175, 190, 203))),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ),
                        ],
                      ],
                    ],
                    if (!_showMale) ...[
                      if (_femaleUpperBodyOptions.isNotEmpty) ...[
                        Text(
                          '$_timeOfDay! Here are female clothing suggestions based on the current temperature:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Upper Body: $_upperBodySuggestion',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Lower Body: $_lowerBodySuggestion',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Shoes: $_shoesSuggestion',
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
                                _upperBodySuggestion =
                                    _getRandomClothing(_femaleUpperBodyOptions);
                                _lowerBodySuggestion =
                                    _getRandomClothing(_femaleLowerBodyOptions);
                                _shoesSuggestion =
                                    _getRandomClothing(_femaleShoesOptions);
                              });
                            },
                            child: Text('Get New Suggestions',
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 175, 190, 203))),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                          ),
                        ],
                      ],
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

  void _toggleGender(bool isMale) {
    setState(() {
      _showMale = isMale;
      _resultsFetched = false;
    });
  }
}

class ClothingItem {
  final String name;
  final String imagePath;

  ClothingItem(this.name, this.imagePath);
}

void main() {
  runApp(MaterialApp(
    home: ClothingSuggestionPage(),
  ));
}
