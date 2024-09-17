import 'package:flutter/material.dart';
import 'package:miosense/Views/activity_level_selection_view.dart';

class HeightSelectionView extends StatefulWidget {
  @override
  _HeightSelectionViewState createState() => _HeightSelectionViewState();
}

class _HeightSelectionViewState extends State<HeightSelectionView> {
  double selectedHeight = 155; // Altura seleccionada por defecto

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
            'Cual Es Tu Altura???',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          // Texto que muestra la altura seleccionada
          Text(
            '${selectedHeight.toStringAsFixed(0)} Cm',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          // Selector de altura (ListWheelScrollView)
          Container(
            height: 200,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedHeight = 155.0 + index;
                });
              },
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return Center(
                    child: Text(
                      '${155 + index}', // Rango de 155 a 175 cm
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  );
                },
                childCount: 21, // Muestra el rango de 155 a 175 cm
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Icon(Icons.arrow_drop_up, color: Colors.yellowAccent, size: 40.0),
          SizedBox(height: 30.0),
          ElevatedButton(
            onPressed: () {
              // Acción al presionar "Continue"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityLevelSelectionView()),
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
}