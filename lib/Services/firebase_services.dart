import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {

  Future<String> uploadImageToFirebase(File imageFile) async {
    print("Attempting to upload image {${imageFile.path}} to firestore");
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.ref().child('images/$fileName');
    UploadTask uploadTask = reference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }

}
