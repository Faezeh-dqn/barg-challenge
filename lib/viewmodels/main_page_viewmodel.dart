import 'package:challenge/models/user.dart';
import 'package:challenge/services/service_locator.dart';
import 'package:challenge/user_repository.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  UserRepository userRepository = getIt<UserRepository>();
  List<User> users = [];
  bool isLoading = false;
  String url =
      "https://www.ssrl-uark.com/wp-content/uploads/2014/06/no-profile-image.png";

  Future<void> getUsers() async {
    users = await userRepository.getUsers();

    update();
  }

  @override
  Future<void> onInit() async {
    isLoading = true;
    await getUsers();
    isLoading = false;

    update();
  }
}
