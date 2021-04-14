import 'package:get/get.dart';

import 'login_controller.dart';

class PedidoController extends GetxController {
  RxList pedidos = [].obs;
  RxDouble subtotal = 0.0.obs;
  RxDouble total = 0.0.obs;

  calcularPedido() {
    subtotal.value = 0.0;
    total.value = 0.0;
    for (var pedido in pedidos) {
      subtotal.value = subtotal.value + pedido['precio'];
    }
    total.value = (subtotal.value * 1.15).roundToDouble();
  }

  obtenerPedidos() {
    LoginController loginController = Get.find<LoginController>();
    pedidos.addAll(loginController.loggedUser['pedido']);
  }
}
