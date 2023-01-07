import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('homepage'),
        actions: [
          IconButton(
            onPressed: () async {
              // Obtain shared preferences.
              final prefs = await SharedPreferences.getInstance();
              prefs.clear();
            },
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Center(
        child: Text(
          '환영합니다',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
