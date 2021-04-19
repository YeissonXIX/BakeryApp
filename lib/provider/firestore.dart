import 'package:bakeryapp/controller/login_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> registrarUsuario(String nombre, String apellido, String correo,
      String contrasena, String confirmecontrasena) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');
    // Call the user's CollectionReference to add a new user
    return users
        .doc(correo)
        .set({
          'nombre': nombre,
          'apellido': apellido,
          'correo': correo,
          'contrasena': contrasena,
          'confirme_contrasena': confirmecontrasena,
          'admin': false,
          'pedidos': []
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> subirPedido(List pedidos) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');
    LoginController loginController = Get.put(LoginController());
    return users
        .doc('${loginController.loggedUser['correo']}')
        .update({'pedidos': pedidos})
        .then((value) => Get.showSnackbar(GetBar(
              duration: Duration(milliseconds: 4000),
              animationDuration: Duration(milliseconds: 500),
              backgroundColor: Colors.green,
              message: 'Vea la pagina de pedidos para ver el total a pagar.',
              titleText: Text(
                'Producto agregado',
                style: TextStyle(color: Colors.white),
              ),
              isDismissible: true,
            )))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<List> obtenerPedidosDeFirebase() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');
    LoginController loginController = Get.put(LoginController());
    var querySnapshot =
        await users.doc('${loginController.loggedUser['correo']}').get();
    return querySnapshot.data()['pedidos'];
  }

  Future<void> subirProducto(String nombre, String precio, String tipo,
      String descripcion, String imagenUrl) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('pasteles');
    // Call the user's CollectionReference to add a new user

    return users
        .add({
          'nombre': nombre,
          'precio': double.parse(precio),
          'tipo': tipo,
          'descripcion': descripcion,
          'pictureUrl': imagenUrl,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future iniciarSesion(String correo, String pass) async {
    List users = await obtenerUsuarios();
    var loggedUser;
    for (var user in users) {
      if (user['correo'] == correo && user['contrasena'] == pass) {
        loggedUser = user;
      }
    }
    return loggedUser;
  }

  Future obtenerPasteles() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('pasteles');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future obtenerUsuarios() async {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('usuarios');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
