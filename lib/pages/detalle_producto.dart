import 'package:bakeryapp/controller/login_controller.dart';
import 'package:bakeryapp/controller/pedido_controller.dart';
import 'package:bakeryapp/pages/ingresar_producto.dart';
import 'package:bakeryapp/provider/firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetalleProducto extends GetView<PedidoController> {
  static final String path = 'detalleproducto';
  LoginController loginController = Get.find<LoginController>();
  final img;

  DetalleProducto({this.img});

  @override
  Widget build(BuildContext context) {
    Map pastel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                pastel['img'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      pastel['nombre'],
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        pastel['descripcion'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Precio:',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black),
                          ),
                          Text(
                            '${pastel['precio']}',
                            style: TextStyle(
                                fontSize: 25.0, color: Colors.green[800]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tipo:',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.grey[800]),
                          ),
                          Text(
                            '${pastel['tipo']}',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.green[800]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    if (loginController.loggedUser['admin']) ...[
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        width: double.infinity,
                      )
                    ] else ...[
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.pedidos.add(pastel);
                            FirestoreService().subirPedido(controller.pedidos);
                            controller.obtenerPedidos();
                            controller.calcularPedido();
                          },
                          child: Text('Mandar a carrito'),
                        ),
                      )
                    ]
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
