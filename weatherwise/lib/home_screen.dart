import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _createDrawerItem(
              icon: Icons.cloud,
              text: 'Check Weather',
              onTap: () =>
                  Navigator.pushNamed(context, '/weather'), // Fixed this line
            ),
            _createDrawerItem(
              icon: Icons.wb_sunny,
              text: 'Check What to Wear',
              onTap: () =>
                  Navigator.pushNamed(context, '/clothing'), // Fixed this line
            ),
            _createDrawerItem(
              icon: Icons.restaurant,
              text: 'Check What to Eat',
              onTap: () =>
                  Navigator.pushNamed(context, '/food'), // Fixed this line
            ),
            _createDrawerItem(
              icon: Icons.question_answer,
              text: 'FAQ',
              onTap: () =>
                  Navigator.pushNamed(context, '/FAQ'), // Fixed this line
            ),
            _createDrawerItem(
              icon: Icons.info,
              text: 'About Us',
              onTap: () =>
                  Navigator.pushNamed(context, '/about'), // Fixed this line
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.lightBlue.shade200, Colors.blue.shade600],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset('assets/WeatherLogo.png', width: 200, height: 200),
            SizedBox(height: 48),
            _buildFeatureButton(context, 'Check Weather', '/weather'),
            SizedBox(height: 16),
            _buildFeatureButton(context, 'Check What to Wear', '/clothing'),
            SizedBox(height: 16),
            _buildFeatureButton(context, 'Check What to Eat', '/food'),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, '/FAQ'); // Navigate to the 'FAQ' page
            },
            child: Icon(Icons.question_answer),
            heroTag: 'fab1',
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, '/about'); // Navigate to the 'FAQ' page
            },
            child: Icon(Icons.info),
            heroTag: 'fab2',
            backgroundColor: Colors.blue.shade300,
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  Widget _buildFeatureButton(
      BuildContext context, String text, String routeName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
        ),
        child: Text(text),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
