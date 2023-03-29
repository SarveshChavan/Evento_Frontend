import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> uploadFile(File? file, String folderName) async {
  final prefs = await SharedPreferences.getInstance();
  final userEmail = prefs.getString('userEmail');
  late Reference ref;
  // Create a Reference to the file
  ref = FirebaseStorage.instance
      .ref()
      .child(folderName!)
      .child('/$userEmail')
      .child('image');

  final metadata = SettableMetadata(
    contentType: 'image/jpeg',
    customMetadata: {'picked-file-path': file!.path},
  );

  await ref.putFile(File(file.path), metadata);
  String url= await ref.getDownloadURL();

  return url;
}
