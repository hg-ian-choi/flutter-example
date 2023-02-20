import 'package:get/get.dart';
import 'package:getx_test/reactive_state_manager/model.dart';

class Controller extends GetxController {
  final person = Person().obs;

  void updateInfo() {
    person.update((Person? val) {
      val?.age++;
      val?.name = 'Ian Choi';
    });
  }
}
