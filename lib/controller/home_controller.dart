import 'package:bakeryapp/provider/firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Map<String, dynamic>> pasteles = [].obs;

  @override
  void onInit() {
    cargarPasteles();
    super.onInit();
  }

  void cargarPasteles() async {
    pasteles = await FirestoreService().obtenerPasteles();
  }
}
