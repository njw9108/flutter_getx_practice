import 'package:get/get.dart';
import 'package:getx_practice/model.dart';

class Controller extends GetxController {
  final person = Person().obs; //observable
  void updateInfo() {
    //state의 현재 value를 가져온다.
    person.update((val) {
      val?.age++;
      val?.name = 'Jinwoo';
    });
  }
}
