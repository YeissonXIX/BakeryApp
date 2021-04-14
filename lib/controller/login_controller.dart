import 'package:bakeryapp/provider/firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var loggedUser =
      <String, dynamic>{'nombre': 'usuario', 'apellido': 'invitado'}.obs;
  var isLogged = false.obs;

  registrarse(String nombre, String apellido, String correo, String contrasena,
      String confirmecontrasena) async {
    await FirestoreService().registrarUsuario(
        nombre, apellido, correo, contrasena, confirmecontrasena);
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 4000),
      animationDuration: Duration(milliseconds: 500),
      backgroundColor: Colors.green,
      message: 'Se ha registrado correctamente',
      titleText: Text(
        'Bienvenido',
        style: TextStyle(color: Colors.white),
      ),
      isDismissible: true,
    ));
  }

  iniciarSesion(String correo, String pass) async {
    var tmp = await FirestoreService().iniciarSesion(correo, pass);
    if (tmp == null) {
      isLogged.value = false;
      Get.showSnackbar(GetBar(
        duration: Duration(milliseconds: 4000),
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        message: 'Usuario o contraseña incorrecta',
        titleText: Text(
          'Error',
          style: TextStyle(color: Colors.white),
        ),
        isDismissible: true,
      ));
    } else {
      loggedUser.value = tmp;
      isLogged.value = true;
      Get.showSnackbar(GetBar(
        duration: Duration(milliseconds: 4000),
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        message:
            'Ya puede regresar a la pagina principal para ver los productos.',
        titleText: Text(
          'Inicio de sesion correcto',
          style: TextStyle(color: Colors.white),
        ),
        isDismissible: true,
      ));
    }
  }

  logOut() async {
    isLogged.value = false;
    loggedUser.value = <String, dynamic>{
      'nombre': 'usuario',
      'apellido': 'invitado'
    };
    Get.showSnackbar(GetBar(
      duration: Duration(milliseconds: 4000),
      animationDuration: Duration(milliseconds: 500),
      backgroundColor: Colors.green,
      message: 'Se ha cerrado sesión',
      titleText: Text(
        'Salir',
        style: TextStyle(color: Colors.white),
      ),
      isDismissible: true,
    ));
  }
}
