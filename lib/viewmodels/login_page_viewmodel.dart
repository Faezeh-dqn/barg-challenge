import 'package:challenge/models/user.dart';
import 'package:challenge/services/global_state.dart';
import 'package:challenge/services/service_locator.dart';
import 'package:challenge/user_repository.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  var userName = "";
  var password = "";
  late User owner;
  UserRepository userRepository = getIt<UserRepository>();
  GlobalState globalState = getIt<GlobalState>();

  getUserName(var value) {
    userName = value;
    update();
  }

  getPassword(var value) {
    password = value;

    update();
  }

  getUsers() async {
    await userRepository.getOwnerProfile();
    owner = globalState.user;
    update();
  }

  Future<bool> registerUser() async {
    bool result = await userRepository.registerUser(userName, password);
    return result;
  }
}
