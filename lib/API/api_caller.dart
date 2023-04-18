import 'package:emptech.app.emptech/API/api_service.dart';

class ApiCaller {
  void main() {
    ApiService().sendImage();
  }
}

void main() {
  ApiCaller().main();
}