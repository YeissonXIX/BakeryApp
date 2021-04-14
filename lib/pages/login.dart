import 'package:bakeryapp/controller/login_controller.dart';
import 'package:bakeryapp/pages/registro.dart';
import 'package:bakeryapp/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  static const path = 'login';
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  get controller => Get.find<LoginController>();

  final TextEditingController controller1 = TextEditingController();

  final TextEditingController controller2 = TextEditingController();

  bool get isEmpty => controller1.text.isEmpty || controller2.text.isEmpty;

  String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bakery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingrese sus datos',
              style: TextStyle(fontSize: 25.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextFormField(
                labelName: 'Usuario',
                hintName: 'Usuario',
                lengthLimiter: LengthLimitingTextInputFormatter(20),
                controller: controller1,
                showMessagError: error,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextFormField(
                obscureText: true,
                labelName: 'Contraseña',
                hintName: 'Contraseña',
                lengthLimiter: LengthLimitingTextInputFormatter(20),
                controller: controller2,
                showMessagError: error,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isEmpty) {
                    setState(() {
                      error = 'No debe dejar ningun campo vacio';
                    });
                    return;
                  } else {
                    setState(() {});
                    error = null;

                    controller.iniciarSesion(
                        controller1.text, controller2.text);
                    controller1.text = '';
                    controller2.text = '';
                  }
                },
                child: Text('Ingresar'),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Registro.path);
                },
                child: Text('Registrate'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
