import 'package:bakeryapp/controller/pedido_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Pedidos extends GetView<PedidoController> {
  const Pedidos({Key key}) : super(key: key);
  get controller => Get.find<PedidoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos'),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.pedidos.length,
                itemBuilder: (c, i) {
                  return Container(
                    height: 100.0,
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            child: CircleAvatar(
                              maxRadius: 50.0,
                              backgroundImage: NetworkImage(
                                  '${controller.pedidos[i]['img']}'),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.pedidos[i]['nombre']}',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Text(
                                'Precio: L.${controller.pedidos[i]['precio']}',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.green),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            width: double.infinity,
            height: 200.0,
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal: ',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        Obx(
                          () => Text(
                            '${controller.subtotal}',
                            style: TextStyle(fontSize: 20.0, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ISV: ',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        Text(
                          '15%',
                          style: TextStyle(fontSize: 20.0, color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total a pagar:',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        Obx(
                          () => Text(
                            '${controller.total}',
                            style: TextStyle(fontSize: 20.0, color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
