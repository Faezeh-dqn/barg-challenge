import 'package:challenge/models/user.dart';
import 'package:challenge/services/global_state.dart';
import 'package:challenge/services/service_locator.dart';
import 'package:challenge/services/user_repository.dart';
import 'package:get/get.dart';

class ProfileConroller extends GetxController {
  UserRepository userRepository = getIt<UserRepository>();
  GlobalState globalState = getIt<GlobalState>();
  late User friend;
  bool isLoading = false;
  late User owner;

  void getOwnerProfile() {
    owner = globalState.user;
  }

//The dateTime of registered field had a bad format so I find the exact time with this function
  findRegiteredTime(String dateTime) {
    String time = dateTime.substring(20);
    String hour = time.substring(1, 3);
    String min = time.substring(5);
    String finalTime = "$hour : $min";
    return finalTime;
  }

  Future<void> getFriendProfile(String guid) async {
    isLoading = true;

    friend = await userRepository.getFriendsProfile(guid);
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    getOwnerProfile();
  }
}
