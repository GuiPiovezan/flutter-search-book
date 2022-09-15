import 'package:flutter/material.dart';
import 'package:flutter_search_book/services/camera.service.dart';
import 'package:flutter_search_book/theme/dark_ligth_theme.theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final cameraService = CameraService();

  String text = 'Seja bem-vindo desenvolvedor';
  final TextRecognizer _textRecognizer = TextRecognizer();

  Future<XFile?> pickImage() async =>
      await ImagePicker().pickImage(source: ImageSource.camera);

  Future<String?> readTextFromImage(XFile imageFile) async {
    final InputImage inputImage;

    inputImage = imageFile as InputImage;

    final recognizedText = await _textRecognizer.processImage(inputImage);

    return recognizedText.text;
  }

  void translateTextImage() async {
    var pickedFile = await pickImage();
    var originalText = await readTextFromImage(pickedFile!);

    setState(() {
      text = originalText!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: translateTextImage,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
