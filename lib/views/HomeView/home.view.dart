import 'package:flutter/material.dart';
import 'package:flutter_search_book/components/app_bar_custom.component.dart';
import 'package:flutter_search_book/components/drawer_custom.component.dart';
import 'package:flutter_search_book/components/text_button_custom.component.dart';
import 'package:flutter_search_book/core/container.history.core.dart';
import 'package:flutter_search_book/services/camera.service.dart';
import 'package:flutter_search_book/services/search_api.services.dart';
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
  final BooksService _booksService = BooksService();

  get inputImageData => null;

  searchBooks() async {
    await _booksService.setResult(text, context);
  }

  Future<XFile?> pickImage() async =>
      await ImagePicker().pickImage(source: ImageSource.camera);

  Future<String?> readTextFromImage(XFile imageFile) async {
    InputImage inputImage;

    inputImage = InputImage.fromFilePath(imageFile.path);

    final recognizedText = await _textRecognizer.processImage(inputImage);

    return recognizedText.text;
  }

  void getTextImage() async {
    var pickedFile = await pickImage();
    var originalText = await readTextFromImage(pickedFile!);

    setState(() {
      text = originalText!;
    });

    searchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: const DrawerCustom(),
      appBar: const AppBarCustom(
        isDrawer: true,
        icon: Icon(Icons.search_rounded),
        title: "Search Book's",
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
            child: const Text(
              "Historico",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: ContainerHistory(),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: TextButtonCustom(
          onPressed: getTextImage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              Text(
                " Buscar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
