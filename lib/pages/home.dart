import 'package:bakeryapp/controller/login_controller.dart';
import 'package:bakeryapp/controller/pedido_controller.dart';
import 'package:bakeryapp/pages/detalle_producto.dart';
import 'package:bakeryapp/pages/ingresar_producto.dart';
import 'package:bakeryapp/pages/login.dart';
import 'package:bakeryapp/pages/pedidos.dart';
import 'package:bakeryapp/provider/firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  static const path = 'home';
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Get.put(LoginController());
    Get.put(PedidoController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bakery'),
      ),
      drawer: Drawer(
        child: Obx(
          () => ListView(
            children: [
              ListTile(
                title: Obx(() => Text('Bienvenido @${loginController.loggedUser['nombre']} ${loginController.loggedUser['apellido']}')),
                subtitle: Text('a la mejor tienda de pasteleria online'),
              ),
              if (!loginController.isLogged.value) ...[
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginPage.path);
                  },
                  leading: Icon(Icons.person),
                  title: Text('Inicio de sesion'),
                ),
              ],
              if (loginController.loggedUser['admin'] ?? false) ...[
                ListTile(
                  onTap: () {
                    if (loginController.isLogged.value) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => IngresarProducto()));
                    } else {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => LoginPage()));
                    }
                  },
                  leading: Icon(Icons.add_business_sharp),
                  title: Text('Ingreso de producto'),
                ),
              ],
              if (loginController.isLogged.value &&
                      !loginController.loggedUser['admin'] ??
                  true) ...[
                ListTile(
                  onTap: () {
                    Get.to(() => Pedidos());
                  },
                  leading: Icon(Icons.shopping_basket_outlined),
                  title: Text('Pedidos'),
                ),
              ],
              if (loginController.isLogged.value) ...[
                ListTile(
                  onTap: () {
                    loginController.logOut();
                  },
                  leading: Icon(Icons.logout),
                  title: Text('Salir'),
                ),
              ]
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: FutureBuilder(
            future: FirestoreService().obtenerPasteles(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: Image.asset('assets/loading.gif'),
                );
              return Container(
                height: double.infinity,
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (c, i) {
                      return GestureDetector(
                        onTap: () {
                          if (loginController.isLogged.value) {
                            Navigator.of(context)
                                .pushNamed(DetalleProducto.path, arguments: {
                              'img': snapshot.data[i]["pictureUrl"],
                              'nombre': snapshot.data[i]["nombre"],
                              'precio': snapshot.data[i]["precio"],
                              'descripcion': snapshot.data[i]["descripcion"]
                            });
                          } else {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.0),
                              height: 300,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data[i]["pictureUrl"],
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(snapshot.data[i]["nombre"]),
                            Text(snapshot.data[i]["precio"].toString()),
                          ],
                        ),
                      );
                    }),
              );
            },
          )),
    );
  }
}
