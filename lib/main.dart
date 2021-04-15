import 'package:bakeryapp/pages/detalle_producto.dart';
import 'package:bakeryapp/pages/home.dart';
import 'package:bakeryapp/pages/ingresar_producto.dart';
import 'package:bakeryapp/pages/login.dart';
import 'package:bakeryapp/pages/registro.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
      home: CustomSplash(
        imagePath: 'assets/pastelogo.png',
        backGroundColor: Colors.white,
        animationEffect: 'zoom-in',
        logoSize: 200,
        home: Home(),
        duration: 2500,
        type: CustomSplashType.StaticDuration,
      ),
      routes: {
        Registro.path: (c) => Registro(),
        LoginPage.path: (e) => LoginPage(),
        Home.path: (e) => Home(),
        DetalleProducto.path: (e) => DetalleProducto(),
        IngresarProducto.path: (e) => IngresarProducto(),
      },
    );
  }
}
