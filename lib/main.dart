import 'package:bakeryapp/pages/detalle_producto.dart';
import 'package:bakeryapp/pages/home.dart';
import 'package:bakeryapp/pages/login.dart';
import 'package:bakeryapp/pages/registro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'controller/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
// or
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Home(),
      routes: {
        Registro.path: (c) => Registro(),
        LoginPage.path: (e) => LoginPage(),
        Home.path: (e) => Home(),
        DetalleProducto.path: (e) => DetalleProducto(),
      },
    );
  }
}
