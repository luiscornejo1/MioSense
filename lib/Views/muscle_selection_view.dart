import 'package:flutter/material.dart';
import 'package:miosense/Views/progress_tracking_view.dart';


class MuscleSelectionView extends StatefulWidget {
  final String fullName;
  final String weight;
  final String height;
  final String gender;

  MuscleSelectionView({

    required this.fullName,
    required this.weight,
    required this.height,
    required this.gender,

  });
  @override
  _MuscleSelectionViewState createState() => _MuscleSelectionViewState();
}

class _MuscleSelectionViewState extends State<MuscleSelectionView> {
  String selectedMuscle = ''; // Variable para almacenar el músculo seleccionado

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
            '¿Qué músculo deseas monitorear?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.0),
          _buildMuscleOption('Cuádriceps', selectedMuscle == 'Cuádriceps'),
          SizedBox(height: 15.0),
          _buildMuscleOption('Tibial', selectedMuscle == 'Tibial'),
          SizedBox(height: 15.0),
          _buildMuscleOption('Abductor', selectedMuscle == 'Abductor'),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: selectedMuscle.isNotEmpty
                ? () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => ProgressTrackingView(
                    fullName: widget.fullName, 
                    weight: widget.weight, 
                    height: widget.height, 
                    selectedMuscle: selectedMuscle)));
                    // Aquí puedes llevar al usuario a la siguiente etapa de la app
                  }
                : null, // Deshabilitado si no se ha seleccionado un músculo
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
                color: Color(0xFFCEFF00),
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para construir cada opción de músculo
  Widget _buildMuscleOption(String muscle, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMuscle = muscle; // Actualiza el músculo seleccionado
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFCEFF00) : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          muscle,
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