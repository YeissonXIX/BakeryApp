import 'package:bakeryapp/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Registro extends StatelessWidget {
  static const path = 'registro';
  const Registro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bakery'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ingrese los datos para registrarlo',
            style: TextStyle(fontSize: 25.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormField(
              labelName: 'Usuario',
              hintName: 'Usuario',
              lengthLimiter: LengthLimitingTextInputFormatter(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormField(
              labelName: 'Apellido',
              hintName: 'Apellido',
              lengthLimiter: LengthLimitingTextInputFormatter(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormField(
              obscureText: true,
              labelName: 'Contraseña',
              hintName: 'Contraseña',
              lengthLimiter: LengthLimitingTextInputFormatter(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyTextFormField(
              obscureText: true,
              labelName: 'Confirme contraseña',
              hintName: 'Confirme contraseña',
              lengthLimiter: LengthLimitingTextInputFormatter(20),
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Ingresar'),
            ),
          )
        ],
      ),
    );
  }
}
