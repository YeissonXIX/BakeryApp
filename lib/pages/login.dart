import 'package:bakeryapp/pages/registro.dart';
import 'package:bakeryapp/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  static const path = 'login';
  const LoginPage({Key key}) : super(key: key);

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
            'Ingrese sus datos',
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
              obscureText: true,
              labelName: 'Contraseña',
              hintName: 'Contraseña',
              lengthLimiter: LengthLimitingTextInputFormatter(20),
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
              onPressed: () {},
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
    );
  }
}
