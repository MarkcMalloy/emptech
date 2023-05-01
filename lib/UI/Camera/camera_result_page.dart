import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CameraResultPage extends StatefulWidget {
  final String imgPath;
  const CameraResultPage({Key? key, required this.imgPath}) : super(key: key);

  @override
  State<CameraResultPage> createState() => _CameraResultPageState();
}

class _CameraResultPageState extends State<CameraResultPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImageDisplayWidget(imagePath: widget.imgPath)
      ),
    );
  }
}

class ImageDisplayWidget extends StatelessWidget {
  final String imagePath;

  ImageDisplayWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      Stack(children: [
        Positioned.fill(
          child: AspectRatio(
            aspectRatio: MediaQuery.of(context).size.aspectRatio,
            //child: CameraPreview(_cameraController),
            child: Image.asset(imagePath),
          ),
        )
      ],),);
  }
}
