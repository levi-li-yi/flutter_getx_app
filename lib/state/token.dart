/*
 * @Author: Levi Li
 * @Date: 2023-11-29 16:02:02
 * @description: 
 */
import 'package:get/get.dart';
import 'package:dart_mock/dart_mock.dart' as mock;

class TokenController extends GetxController {
  static TokenController get to => Get.find();

  String token = '';

  void set() {
    token = mock.sentence();
    update();
  }

  void delete() {
    token = '';
    update();
  }
}
