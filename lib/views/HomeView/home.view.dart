import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_book/services/camera.service.dart';
import 'package:flutter_search_book/theme/dark_ligth_theme.theme.dart';

class HomeView extends StatelessWidget {
  final cameraService = CameraService();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Seja bem-vindo, desenvolvedor!',
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, // error
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CameraCamera(onFile: (arquivo) => print(arquivo));
              },
            ),
          );
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
