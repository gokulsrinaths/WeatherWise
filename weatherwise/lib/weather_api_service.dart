import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiService {
  final String apiKey = '85e0d17fee9a4cecaaf14044241601';
  Future<Map<String, dynamic>> getWeather(String city) async {
    final response = await http.get(
      Uri.parse(
          'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      // Log the status code and response body
      print('Request failed with status: ${response.statusCode}.');
      print('Response body: ${response.body}');
      throw Exception('Failed to load weather');
    }
  }
}
