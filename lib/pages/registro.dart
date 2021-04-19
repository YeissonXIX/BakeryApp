import 'package:bakeryapp/controller/login_controller.dart';
import 'package:bakeryapp/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Registro extends StatefulWidget {
  static const path = 'registro';
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final controller = Get.find<LoginController>();

  final TextEditingController controller1 = TextEditingController();

  final TextEditingController controller2 = TextEditingController();

  final TextEditingController controller3 = TextEditingController();

  final TextEditingController controller4 = TextEditingController();

  final TextEditingController controller5 = TextEditingController();

  bool get isEmpty =>
      controller1.text.isEmpty ||
      controller2.text.isEmpty ||
      controller3.text.isEmpty ||
      controller4.text.isEmpty ||
      controller5.text.isEmpty;

  bool get isPassOk => controller3.text == controller4.text;

  String error;
  String passError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bakery'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ingrese los datos para registrarlo',
                  style: TextStyle(fontSize: 25.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(
                    controller: controller1,
                    labelName: 'Usuario',
                    hintName: 'Usuario',
                    lengthLimiter: LengthLimitingTextInputFormatter(50),
                    showMessagError: error,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(
                    controller: controller2,
                    labelName: 'Apellido',
                    hintName: 'Apellido',
                    lengthLimiter: LengthLimitingTextInputFormatter(50),
                    showMessagError: error,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(
                    controller: controller5,
                    labelName: 'Correo',
                    hintName: 'Correo',
                    lengthLimiter: LengthLimitingTextInputFormatter(50),
                    showMessagError: error,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(
                    controller: controller3,
                    obscureText: true,
                    labelName: 'Contraseña',
                    hintName: 'Contraseña',
                    lengthLimiter: LengthLimitingTextInputFormatter(50),
                    showMessagError: passError,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(
                    controller: controller4,
                    obscureText: true,
                    labelName: 'Confirme contraseña',
                    hintName: 'Confirme contraseña',
                    lengthLimiter: LengthLimitingTextInputFormatter(50),
                    showMessagError: passError,
                  ),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (isEmpty) {
                        setState(() {
                          error = 'No debe dejar ningun campo vacio';
                          passError = 'No debe dejar ningun campo vacio';
                        });
                        return;
                      } else if (!isPassOk) {
                        setState(() {
                          error = null;
                          passError = 'Contrasenas no son iguales';
                          return;
                        });
                      } else {
                        error = null;
                        passError = null;
                        await controller.registrarse(
                          controller1.text,
                          controller2.text,
                          controller5.text,
                          controller3.text,
                          controller4.text,
                        );
                        controller1.text = '';
                        controller2.text = '';
                        controller3.text = '';
                        controller4.text = '';
                        controller5.text = '';
                      }
                    },
                    child: Text('Ingresar'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
