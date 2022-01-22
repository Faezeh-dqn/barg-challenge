import 'package:challenge/models/user.dart';
import 'package:challenge/services/service_locator.dart';
import 'package:challenge/user_repository.dart';
import 'package:get/get.dart';

class ProfileConroller extends GetxController {
  UserRepository userRepository = getIt<UserRepository>();
  late User friend;
  bool isLoading = false;

  getFriendProfile(String guid) async {
    isLoading = true;
    friend = await userRepository.getFriendsProfile(guid);
    isLoading = false;
    update();
  }
}
