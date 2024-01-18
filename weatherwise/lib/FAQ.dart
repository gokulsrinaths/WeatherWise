import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I check the weather for my city?',
      'answer':
          'Navigate to the Weather tab, enter your city name, and press the search button.'
    },
    {
      'question': 'Can I get clothing suggestions based on the weather?',
      'answer':
          'Yes! After checking the weather, navigate to the Clothing tab to see suggestions.'
    },
    {
      'question': 'How does the Food Suggestion feature work?',
      'answer':
          'Based on the current temperature, the app will suggest suitable food options.'
    },
    {
      'question': 'What does the Randomize button do?',
      'answer': 'It provides another set of suggestions for food or clothing.'
    },
    {
      'question': 'How can I report a bug or suggest a feature?',
      'answer':
          'Please use the feedback form in the app or contact us through our support email.'
    },
    {
      'question': 'Is there a way to customize the app settings?',
      'answer':
          'Yes, go to the Settings tab where you can customize various options.'
    },
    {
      'question': 'How to run this app?',
      'answer':
          'Install the app from the Play Store or App Store, open it, and follow the on-screen instructions.'
    },
    {
      'question': 'Is this app available for both Android and iOS?',
      'answer':
          'Yes, the app is cross-platform and works on both Android and iOS devices.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        backgroundColor: Colors.blue, // Set the app bar background color
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: faqs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ExpansionTile(
                    title: Text(
                      faqs[index]['question']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(faqs[index]['answer']!),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Image.asset(
                'assets/WeatherLogo.png', // Replace with your logo image path
                width: 50, // Adjust the width as needed
                height: 50, // Adjust the height as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
