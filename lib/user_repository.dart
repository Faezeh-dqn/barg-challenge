import 'dart:convert';

import 'package:challenge/models/user.dart';
import 'package:challenge/services/global_state.dart';
import 'package:flutter/services.dart' show rootBundle;

class UserRepository {
  late GlobalState globalState;
  UserRepository({required this.globalState});

  Future<List<User>> getUsers() async {
    List users = [];
    var jsonData = await rootBundle.loadString('assets/userPrfofile.json');
    users = json.decode(jsonData);
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return users.map((e) => User.fromJson(e)).toList();
  }

  Future<void> getOwnerProfile() async {
    List<User> users = await getUsers();
    globalState.user = users.first;
  }

  Future<User> getFriendsProfile(String guid) async {
    List<User> users = await getUsers();

    return users.singleWhere((user) => user.guid == guid);
  }

  Future<bool> registerUser(String userName, String password) async {
    if (password != "12345678" || userName != "barg") {
      return false;
    } else {
      return true;
    }
  }
}
