import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CargarImagen {
  File archivo;

  cargarImagen() async {
    return await ImagePicker().getImage(source: ImageSource.gallery);
  }
}
