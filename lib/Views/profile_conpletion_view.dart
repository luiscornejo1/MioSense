import 'package:flutter/material.dart';
import 'muscle_selection_view.dart';


import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileCompletionView extends StatefulWidget {
  @override
  _ProfileCompletionViewState createState() => _ProfileCompletionViewState();
}

class _ProfileCompletionViewState extends State<ProfileCompletionView> {
  // Controladores para los campos de texto
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  File? _image; // Almacena la imagen seleccionada

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Completa Tu Perfil',
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Foto de perfil
            GestureDetector(
              onTap: _pickImage, // Selecciona imagen al hacer clic
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: _image != null
                    ? FileImage(_image!) // Muestra la imagen seleccionada
                    : AssetImage('assets/images/default_profile.jpg')
                        as ImageProvider, // Imagen por defecto
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.yellowAccent,
                    child: Icon(Icons.camera_alt, color: Colors.black, size: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Campos del perfil
            _buildTextField('Full name', fullNameController),
            SizedBox(height: 15.0),
            _buildTextField('Nickname', nicknameController),
            SizedBox(height: 15.0),
            _buildTextField('Email', emailController),
            SizedBox(height: 15.0),
            _buildTextField('Mobile Number', mobileNumberController),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar "Start"
                print('Perfil completado: ${fullNameController.text}, ${nicknameController.text}, ${emailController.text}, ${mobileNumberController.text}');
                Navigator.push(context,
                MaterialPageRoute(builder:(context)=> MuscleSelectionView()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              ),
              child: Text(
                'Start',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir los campos de texto
  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: const Color.fromARGB(179, 0, 0, 0)),
        filled: true,
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
