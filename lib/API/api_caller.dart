import 'dart:io';

import 'package:emptech.app.emptech/API/api_service.dart';

class ApiCaller {
  void main() {
    ApiService().sendImage(File("assets/niels.jpg"));
  }
}

void main() {
  ApiCaller().main();
}