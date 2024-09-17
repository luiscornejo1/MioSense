import 'package:flutter/material.dart';
import 'login_view.dart';

// lib/views/splash_screen.dart

import 'package:flutter/material.dart';
import 'login_view.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo oscuro
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'MIOSENSE',
              style: TextStyle(
                color: Color.fromARGB(255, 180, 228, 9),
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
            style: ElevatedButton.styleFrom(
              side: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            ),
            child: Text(
              'Go to Login',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
