import 'package:get/get.dart';

class LuasController extends GetxController {
  final count = 0.obs;
  increment() => count.value++;

  final hasilLuas = RxDouble(0.0);
  luasSegitiga(double alas, double tinggi) {
    hasilLuas.value = 0.5 * alas * tinggi;
  }
}
