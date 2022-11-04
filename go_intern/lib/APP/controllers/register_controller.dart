import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isHiden1 = true.obs;
  var isHiden2 = true.obs;
  
  toogle1() {
    isHiden1.value = !isHiden1.value;
  }

  toogle2() {
    isHiden2.value = !isHiden2.value;
  }
}
