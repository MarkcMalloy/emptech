import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras[0],
      ResolutionPreset.medium,
    );
    await _cameraController.initialize();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _onCaptureButtonPressed() async {
    late CameraController cameraController;
    try {
      cameraController = _cameraController;
      if (!cameraController.value.isInitialized) {
        return;
      }

      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      await cameraController.takePicture();
      setState(() {
        _imagePath = path;
      });

      // Send image as HTTP POST request
      File imageFile = File(_imagePath!);
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      var response = await http.post(
        Uri.parse('https://example.com/upload'),
        body: {'image': base64Image},
      );

      if (response.statusCode == 200) {
        // Image uploaded successfully
        print('Image uploaded successfully!');
      } else {
        // Failed to upload image
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error capturing image: $e');
    } finally {
      cameraController?.dispose();
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_cameraController),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: _onCaptureButtonPressed,
              child: Text('Capture Image'),
            ),
          ),
        ],
      ),
    );
  }
}
