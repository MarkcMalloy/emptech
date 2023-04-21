import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
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
    //var url = 'http://127.0.0.1:5001/upload-image'; // Local URL
    var url = 'http://10.209.192.7:5001/upload-image'; // IPV4
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      imageFile.path,
      contentType: MediaType('image', 'jpeg'),
    ));
    var response = await request.send();
    if (response.statusCode == 200) {
      // Read response and save image in shared preferences
      var byteString = await response.stream.bytesToString();
      var encoded = utf8.encode(byteString);
      var imagePath = await saveImageInSharedPreferences(encoded.toList().toString());
      print("created a new image with path: $imagePath");
      return imagePath;
    } else {
      print('Error uploading image. Status code: ${response.statusCode}');
      return "";
    }
  }

  Future<String> saveImageInSharedPreferences(String base64Image) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String fileName = 'image_result.jpg';
      print(base64Image.toString());
      await prefs.setString(fileName, base64Image);
      return fileName;
    } catch (e) {
      print('Error saving image in shared preferences: $e');
      return "";
    }
  }

  /*
  Future<Image> convertFileToImage(File picture) async {
    List<int> imageBase64 = picture.readAsBytesSync();
    String imageAsString = base64Encode(imageBase64);
    Uint8List uint8list = base64.decode(imageAsString);
    Image image = Image.onCreate(uint8list);
    return image;
  }
   */
}
