import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiService {
  static void main() {}

  void sendImage() async {
    /*
  This Dart code creates a http.MultipartRequest with a http.MultipartFile that contains the JPG file.
  The MultipartRequest is then sent to the Flask server using the request.send() method.
   */
    var url = 'http://127.0.0.1:5000/upload-image';
    var currentDirectory = Directory.current;
    var imagePath = '${currentDirectory.path}/assets/niels(1).jpg';
    var file = File(imagePath);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      file.path,
      contentType: MediaType('image', 'jpeg'),
    ));
    var response = await request.send();
    if (response.statusCode == 200) {
      var fileName = 'assets/pythonresult/image.jpg';
      var output = File('${currentDirectory.path}/$fileName');
      await response.stream.pipe(output.openWrite());
      print('Image uploaded successfully and saved at $fileName');
    } else {
      print('Error uploading image. Status code: ${response.statusCode}');
    }
  }
}
