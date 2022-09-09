import 'package:camera_camera/camera_camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraService {
  final ImagePicker _picker = ImagePicker();
  List<CameraDescription> cameras = [];
  CameraController? controller;

  loadCamera() async {
    try {
      cameras = await availableCameras();
    } on CameraException {
      print('Câmera indisponível');
    }
  }

  _startCamera() async {
    if (cameras.isEmpty) {
      print("Camera não encontrada");
    } else {
      _previewCamera(cameras.first);
    }
  }

  _previewCamera(CameraDescription camera) async {
    final CameraController cameraController = CameraController(
        camera, ResolutionPreset.high,
        enableAudio: false, imageFormatGroup: ImageFormatGroup.jpeg);
    controller = cameraController;
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  Future<void> pickImage() async {
    var file = await _picker.pickImage(source: ImageSource.camera);

    print(file!.path);
  }
}
