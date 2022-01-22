import 'package:challenge/models/user.dart';
import 'package:challenge/services/global_state.dart';
import 'package:challenge/services/service_locator.dart';
import 'package:challenge/services/user_repository.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  var userName = "";
  var password = "";
  late User owner;
  UserRepository userRepository = getIt<UserRepository>();
  GlobalState globalState = getIt<GlobalState>();

  void setUserName(var value) {
    userName = value;
    update();
  }

  void setPassword(var value) {
    password = value;

    update();
  }

  Future<bool> registerUser() async {
    bool result = await userRepository.registerUser(userName, password);
    return result;
  }
}
