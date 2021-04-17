import 'dart:io';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';

class CloudinaryProvider {
  subirImagen(File file) async {
    final cloudinary = Cloudinary(
        '794812174781711', 'Sv5LdqNxBxkZZEIlWffCKJJHhb0', 'dlgqfma3d');
    final response = await cloudinary.uploadFile(
      filePath: file.path,
      resourceType: CloudinaryResourceType.image,
    );
    return response.secureUrl;
  }
}
