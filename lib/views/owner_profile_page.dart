import 'package:challenge/models/user.dart';
import 'package:challenge/viewmodels/owner_profile_viewmodel.dart';
import 'package:challenge/views/friend_profile_page.dart';

import 'package:challenge/views/theme/colorsPalette.dart';
import 'package:challenge/views/theme/text_style.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OwnerProfilePage extends StatelessWidget {
  const OwnerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileConroller profileController = Get.put(ProfileConroller());
    profileController.onInit();
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: profileController,
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
                BackButtonAndName(owner: profileController.owner),
                UserInfoCard(
                  owner: profileController.owner,
                  profileConroller: profileController,
                ),
                (profileController.owner.isOwner == true)
                    ? const EditButton()
                    : Divider(
                        color: dividerColor,
                        endIndent: 10,
                        indent: 10,
                      ),
                const Friendslabel(),
                FriendsList(
                  owner: profileController.owner,
                  profileConroller: profileController,
                ),
                const GreetingLabel(),
                GreetingBox(owner: profileController.owner),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GreetingBox extends StatelessWidget {
  const GreetingBox({
    Key? key,
    required this.owner,
  }) : super(key: key);

  final User owner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          border: Border.all(color: Colors.blue),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Text(
            owner.greeting,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class GreetingLabel extends StatelessWidget {
  const GreetingLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Greeting :",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}

class Friendslabel extends StatelessWidget {
  const Friendslabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Friends :",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}

class FriendsList extends StatelessWidget {
  const FriendsList({
    Key? key,
    required this.owner,
    required this.profileConroller,
  }) : super(key: key);

  final User owner;
  final ProfileConroller profileConroller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: owner.friends.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: ElevatedButton(
              onPressed: () async {
                await profileConroller
                    .getFriendProfile(owner.friends[index].guid);

                Get.to(
                  FriendProfilePage(friend: profileConroller.friend),
                );
              },
              child: Text(
                owner.friends[index].name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                elevation: MaterialStateProperty.all(0),
                fixedSize: MaterialStateProperty.all(
                  const Size(
                    100,
                    50,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        "Edit",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          const Size(250, 50),
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard(
      {Key? key, required this.owner, required this.profileConroller})
      : super(key: key);

  final User owner;
  final ProfileConroller profileConroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.amber.shade100,
          border: Border.all(color: Colors.amber),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Balance : ${owner.balance}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Age : ${owner.age}", style: textStyle),
                  Text(
                    "Registered :${profileConroller.findRegiteredTime(owner.registered)}",
                    style: textStyle,
                  ),
                ],
              ),
              Text("About : ${owner.about}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}

class BackButtonAndName extends StatelessWidget {
  const BackButtonAndName({
    Key? key,
    required this.owner,
  }) : super(key: key);

  final User owner;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
            ),
          ),
        ),
        Text(
          owner.name,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
