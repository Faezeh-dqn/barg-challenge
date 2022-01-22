import 'package:challenge/models/user.dart';
import 'package:challenge/services/global_state.dart';
import 'package:challenge/services/service_locator.dart';
import 'package:challenge/services/user_repository.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  UserRepository userRepository = getIt<UserRepository>();
  GlobalState globalState = getIt<GlobalState>();
  List<User> users = [];
  bool isLoading = false;
  late User owner;

  Future<void> getUsers() async {
    users = await userRepository.getUsers();

    update();
  }

  Future<void> getOwnerProfile() async {
    await userRepository.getOwnerProfile();
    owner = globalState.user;
    update();
  }

  @override
  Future<void> onInit() async {
    isLoading = true;
    await getUsers();
    await getOwnerProfile();
    isLoading = false;
    update();
  }
}
