import 'package:flutter/material.dart';
import 'package:miosense/Views/height_selection_view.dart';

class WeightSelectionView extends StatefulWidget {
  @override
  _WeightSelectionViewState createState() => _WeightSelectionViewState();
}

class _WeightSelectionViewState extends State<WeightSelectionView> {
  bool isKgSelected = true; // Variable para alternar entre KG y LB
  double selectedWeight = 75; // Peso seleccionado por defecto

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
            'Cual Es Tu Peso??',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildWeightUnitButton('KG', isKgSelected),
              SizedBox(width: 20.0),
              _buildWeightUnitButton('LB', !isKgSelected),
            ],
          ),
          SizedBox(height: 30.0),
          // Slider personalizado para seleccionar el peso
          Container(
            height: 150,
            child: SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Color(0xFFCEFF00),
                inactiveTrackColor: Colors.grey[800],
                thumbColor: Color(0xFFCEFF00),
                overlayColor: Colors.yellow.withOpacity(0.2),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Slider(
                min: isKgSelected ? 40 : 90, // Rango para KG o LB
                max: isKgSelected ? 150 : 330,
                value: selectedWeight,
                divisions: isKgSelected ? 110 : 240, // Divisiones según KG o LB
                onChanged: (double value) {
                  setState(() {
                    selectedWeight = value;
                  });
                },
              ),
            ),
          ),
          Icon(Icons.arrow_drop_up, color: Colors.yellowAccent, size: 40.0),
          Text(
            '${selectedWeight.toStringAsFixed(0)} ${isKgSelected ? 'Kg' : 'Lb'}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              // Acción al presionar "Continue"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HeightSelectionView()),
              );
            },
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

  // Botón personalizado para seleccionar la unidad de peso
  Widget _buildWeightUnitButton(String unit, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isKgSelected = unit == 'KG';
          selectedWeight = isKgSelected ? 75 : 165; // Restablece el peso
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFCEFF00) : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color(0xFFCEFF00)),
        ),
        child: Text(
          unit,
          style: TextStyle(
            color: isSelected ? Colors.black : Color(0xFFCEFF00),
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}