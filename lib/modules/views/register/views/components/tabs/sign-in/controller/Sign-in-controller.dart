import 'package:get/get.dart';
import '../model/Sign-in-model.dart';

class SignInController extends GetxController {
  SignInModel model = SignInModel(password: false.obs);

  hidePassword() {
    model.password.value = !model.password.value;
  }
}
