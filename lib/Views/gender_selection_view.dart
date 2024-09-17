import 'package:flutter/material.dart';
import 'package:miosense/Views/age_selection_view.dart';

class GenderSelectionView extends StatefulWidget {
  @override
  _GenderSelectionViewState createState() => _GenderSelectionViewState();
}

class _GenderSelectionViewState extends State<GenderSelectionView> {
  String selectedGender = ''; // Variable para almacenar el género seleccionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo con degradado
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey[900]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CUAL ES TU GÉNERO?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.0),
              _buildGenderOption('Male', Icons.male, selectedGender == 'Male'),
              SizedBox(height: 20.0),
              _buildGenderOption('Female', Icons.female, selectedGender == 'Female'),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: selectedGender.isNotEmpty
                    ? () {
                        // Acción para continuar con el género seleccionado
                        Navigator.push(context,
                        MaterialPageRoute(builder:(context)=> AgeSelectionView()),
                        );
                      }
                    : null, // Botón deshabilitado si no se ha seleccionado un género
                style: ElevatedButton.styleFrom(
                  
                  side: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  elevation: 5, // Añade elevación al botón
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Color.fromARGB(255, 5, 5, 5),
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para construir la opción de género con animación y profundidad
  Widget _buildGenderOption(String gender, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender; // Actualizar el género seleccionado
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 120.0,  // Ajuste del tamaño del círculo
            height: 120.0, // Ajuste del tamaño del círculo
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFFCEFF00) : Colors.grey[800], // Cambiar el color si está seleccionado
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(0, 8), // Dirección de la sombra para más profundidad
                ),
              ],
            ),
            child: Icon(icon, size: 60.0, color: isSelected ? Colors.black : Colors.white),
          ),
          SizedBox(height: 10.0), // Espacio entre el círculo y el texto
          Text(
            gender,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70, // Diferenciar el color del texto
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}