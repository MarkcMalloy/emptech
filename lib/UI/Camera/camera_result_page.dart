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
    print("yo");
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
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          String? base64Image = snapshot.data!.getString(imagePath);
          if (base64Image != null) {
            return Image.memory(
              base64Decode(base64Image),
              fit: BoxFit.cover,
            );
          } else {
            return Text('Image not found');
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
