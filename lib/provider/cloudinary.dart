import 'dart:io';

import 'package:cloudinary_client/cloudinary_client.dart';

class CloudinaryProvider {
  subirImagen(File file) async {
    CloudinaryClient client = new CloudinaryClient(
        '794812174781711', 'Sv5LdqNxBxkZZEIlWffCKJJHhb0', 'dlgqfma3d');
    var response = await client.uploadImage(file.path);
    return response.secure_url;
  }
}
