import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiService {
  static void main() {}

  Future<String> sendImage(File imageFile) async {
    /*
  This Dart code creates a http.MultipartRequest with a http.MultipartFile that contains the JPG file.
  The MultipartRequest is then sent to the Flask server using the request.send() method.
   */
    var currentDirectory = Directory.current;
    print("image: ${imageFile.path}");
    //imageFile = File("Niels(1).jpg");
    var url = 'http://127.0.0.1:5001/upload-image';
    //var url = 'http://10.209.234.69:5001/upload-image';

    //var imagePath = '../assets/niels(1).jpg';
    //var file = File(imagePath);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
      contentType: MediaType('image', 'jpeg'),
    ));
    var response = await request.send();
    if (response.statusCode == 200) {
      var fileName = 'assets/pythonresult/image.jpg';
      var output = File('${currentDirectory.path}/$fileName');
      await response.stream.pipe(output.openWrite());
      print('Image uploaded successfully and saved at $fileName');
      return fileName;
    } else {
      print('Error uploading image. Status code: ${response.statusCode}');
      return "";
    }

  }
}
