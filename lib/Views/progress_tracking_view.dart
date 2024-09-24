import 'package:flutter/material.dart';

import 'package:flutter_blue/flutter_blue.dart';

class ProgressTrackingView extends StatefulWidget {
  final String fullName;
  final String weight;
  final String height;
  final String selectedMuscle;

  ProgressTrackingView({
    required this.fullName,
    required this.weight,
    required this.height,
    required this.selectedMuscle,
  });

  @override
  _ProgressTrackingViewState createState() => _ProgressTrackingViewState();
}

class _ProgressTrackingViewState extends State<ProgressTrackingView> {
  bool isTracking = false;


  void startTracking() {
    setState(() {
      isTracking = true;
    });

    FlutterBlue flutterBlue = FlutterBlue.instance;

    flutterBlue.startScan(timeout: Duration(seconds: 4));

    var subscription = flutterBlue.scanResults.listen((results){
      for (ScanResult r in results){
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

    flutterBlue.stopScan();
    
  }

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
            Navigator.pop(context); // Volver atrás
          },
        ),
        title: Text(
          'Progress Tracking',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Sección de perfil con los datos previos
            Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/images/default_profile.jpg'),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.fullName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '${widget.weight} Kg',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      '${widget.height} CM',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.0),
            // Sección de músculo seleccionado
            Text(
              'Músculo a Monitorear: ${widget.selectedMuscle}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Imagen del cuerpo con músculos
            Expanded(
              child: Container(
                child: Image.asset('assets/images/body_muscle.png'), // Cambia esto por la imagen correcta
              ),
            ),
            // Botón de INICIAR TRACKEO
            ElevatedButton(
              onPressed: isTracking ? null : startTracking,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              ),
              child: Text(
                isTracking ? 'Trackeando...' : 'INICIAR TRACKEO',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
