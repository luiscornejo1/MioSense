// lib/views/activity_level_selection_view.dart

import 'package:flutter/material.dart';
import 'package:miosense/Views/profile_conpletion_view.dart';

class ActivityLevelSelectionView extends StatefulWidget {
  @override
  _ActivityLevelSelectionViewState createState() => _ActivityLevelSelectionViewState();
}

class _ActivityLevelSelectionViewState extends State<ActivityLevelSelectionView> {
  String selectedLevel = ''; // Variable para almacenar el nivel seleccionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellowAccent),
          onPressed: () {
            Navigator.pop(context); // Acción para volver atrás
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nivel De Actividad Física',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Quiere decir cuánta experiencia tienes haciendo ejercicios o practicando algún deporte o actividad física.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 30.0),
          _buildActivityLevelOption('Beginner', selectedLevel == 'Beginner'),
          SizedBox(height: 15.0),
          _buildActivityLevelOption('Intermediate', selectedLevel == 'Intermediate'),
          SizedBox(height: 15.0),
          _buildActivityLevelOption('Advance', selectedLevel == 'Advance'),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: selectedLevel.isNotEmpty
                ? () {
                    // Acción al presionar "Continue"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileCompletionView()),
                    );
                  }
                : null, // Deshabilitado si no se ha seleccionado un nivel
            style: ElevatedButton.styleFrom(
              side: BorderSide(color: Color(0xFFCEFF00)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            ),
            child: Text(
              'Continue',
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

  // Widget para construir cada opción de nivel de actividad
  Widget _buildActivityLevelOption(String level, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLevel = level; // Actualiza el nivel seleccionado
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFCEFF00) : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          level,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.purple,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}