import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
class ApiService {

  static void main() {

  }

  void sendImage() async {
    /*
  This Dart code creates a http.MultipartRequest with a http.MultipartFile that contains the JPG file.
  The MultipartRequest is then sent to the Flask server using the request.send() method.
   */
    var url = 'http://localhost:5000/upload'; // Replace with your server URL
    var currentDirectory = Directory.current;
    var imagePath = '${currentDirectory.path}/assets/onboarding_picture_1.jpg';
    var file = File(imagePath);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Content-Type'] = 'application/json';
    request.files.add(await http.MultipartFile.fromPath('file', file.path,
        contentType: MediaType('image', 'jpeg')));
    var response = await request.send();
    if (response.statusCode == 200) {
      print(response.stream.toString());
      print('Image uploaded successfully!');
    } else {
      print('Error uploading image. Status code: ${response.statusCode}');
    }
  }

}