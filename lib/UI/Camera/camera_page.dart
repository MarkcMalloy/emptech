import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:emptech.app.emptech/API/api_service.dart';
import 'package:emptech.app.emptech/Utils/emptech_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  ApiService apiService = ApiService();
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
    //late CameraController cameraController;
    //var imagePath = '../assets/niels(1).jpg';
    //var file = File(imagePath);
    try {
      /*
      cameraController = _cameraController;
      if (!cameraController.value.isInitialized) {
        return;
      }

      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

       */
      //var img = await cameraController.takePicture();
      setState(() {
        //_imagePath = img.path;
      });

      // Send image as HTTP POST request
      var response = await apiService.sendImage(File(""));
    } catch (e) {
      print('Error capturing image: $e');
    } finally {
      //cameraController?.dispose();
    }
  }


  @override
  void dispose() {
    _cameraController.dispose();
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
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              child: CameraPreview(_cameraController),
            ),
          ),
          Positioned(
            bottom: 120,
            right: 90,
            left: 90,
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: buttonColor(CustomColors.backgroundColor),
                  backgroundColor: buttonColor(CustomColors.foregroundColor)),
              onPressed: (){
                _onCaptureButtonPressed();
              },
              child: Text(
                'Capture Image',
                style: GoogleFonts.roboto(
                    fontSize: 22, fontWeight: FontWeight.w400),
              ),
            )
          ),
        ],
      ),
    );
  }

  MaterialStatePropertyAll<Color> buttonColor(Color _color) {
    return MaterialStatePropertyAll<Color>(_color);
  }
}
