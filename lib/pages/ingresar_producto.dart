import 'dart:io';

import 'package:bakeryapp/provider/cloudinary.dart';
import 'package:bakeryapp/provider/firestore.dart';
import 'package:bakeryapp/provider/image_picker.dart';
import 'package:bakeryapp/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class IngresarProducto extends StatefulWidget {
  static const path = 'ingreso';
  const IngresarProducto({Key key}) : super(key: key);

  @override
  _IngresarProductoState createState() => _IngresarProductoState();
}

class _IngresarProductoState extends State<IngresarProducto> {
  String imgpath = '';
  final TextEditingController controller1 = TextEditingController();

  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  File foto;
  String error;
  bool get isEmpty =>
      controller1.text.isEmpty ||
      controller2.text.isEmpty ||
      controller3.text.isEmpty ||
      controller4.text.isEmpty;
  @override
  Widget build(BuildContext context) {
    /* Map pastel;
    if (ModalRoute.of(context)?.settings != null) {
      pastel = ModalRoute.of(context).settings.arguments;
      controller1.text = pastel['nombre'];
      controller2.text = pastel['precio'];
      controller3.text = pastel['tipo'];
      controller4.text = pastel['descripcion'];
      imgpath = pastel['pictureUrl'];
    } */
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingrese nuevo producto'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  foto = await CargarImagen().cargarImagen();
                  setState(() {});
                },
                child: Container(
                    width: double.infinity,
                    height: 200.0,
                    color: Colors.grey,
                    child: foto != null
                        ? Image(
                            image: FileImage(foto),
                            fit: BoxFit.contain,
                          )
                        : imgpath?.isEmpty ?? true
                            ? Icon(
                                Icons.camera_alt_outlined,
                                size: 100.0,
                              )
                            : Image(
                                image: NetworkImage(imgpath),
                                fit: BoxFit.contain,
                              )),
              ),
              SizedBox(height: 10.0),
              MyTextFormField(
                labelName: 'Nombre',
                hintName: 'Nombre',
                lengthLimiter: LengthLimitingTextInputFormatter(20),
                controller: controller1,
                showMessagError: error,
              ),
              SizedBox(height: 10.0),
              MyTextFormField(
                labelName: 'Precio',
                hintName: 'Precio',
                lengthLimiter: LengthLimitingTextInputFormatter(20),
                controller: controller2,
                showMessagError: error,
              ),
              SizedBox(height: 10.0),
              MyTextFormField(
                labelName: 'Tipo',
                hintName: 'Tipo',
                lengthLimiter: LengthLimitingTextInputFormatter(20),
                controller: controller3,
                showMessagError: error,
              ),
              SizedBox(height: 10.0),
              Text('Descripcion'),
              SizedBox(height: 10.0),
              TextField(
                controller: controller4,
                maxLines: 5,
                decoration: InputDecoration(
                    errorText: error,
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    hintText: "Ingrese su texto aqui "),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (isEmpty) {
                      setState(() {
                        error = 'No debe dejar ningun campo vacio';
                      });
                      return;
                    } else {
                      setState(() {});
                      error = null;
                      var imagepath =
                          await CloudinaryProvider().subirImagen(foto);
                      FirestoreService().subirProducto(
                          controller1.text,
                          controller2.text,
                          controller3.text,
                          controller4.text,
                          imagepath);
                      controller3.text = '';
                      controller4.text = '';
                      controller2.text = '';
                      controller1.text = '';
                      foto = null;
                      setState(() {});
                      Get.showSnackbar(GetBar(
                        duration: Duration(milliseconds: 4000),
                        animationDuration: Duration(milliseconds: 500),
                        backgroundColor: Colors.green,
                        message:
                            'Se ha agregado un nuevo producto a la galeria de imagenes',
                        titleText: Text(
                          'Exitoso',
                          style: TextStyle(color: Colors.white),
                        ),
                        isDismissible: true,
                      ));
                    }
                  },
                  child: Text('Subir producto'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
