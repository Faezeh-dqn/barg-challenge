import 'package:challenge/models/user.dart';

import 'package:challenge/views/theme/colorsPalette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendProfilePage extends StatelessWidget {
  final User friend;
  const FriendProfilePage({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackButtonAndName(
                friend: friend,
              ),
              FriendInfoCard(friend: friend),
              (friend.isOwner == true)
                  ? const EditButton()
                  : Divider(
                      color: dividerColor,
                      endIndent: 10,
                      indent: 10,
                    ),
              const FriendsLabel(),
              FriendsList(friend: friend),
              const GreetingLabel(),
              GreetingBox(friend: friend),
            ],
          ),
        ),
      ),
    );
  }
}

class GreetingBox extends StatelessWidget {
  const GreetingBox({
    Key? key,
    required this.friend,
  }) : super(key: key);

  final User friend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: lightBlue,
          border: Border.all(color: blue),
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
            friend.greeting,
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

class FriendsList extends StatelessWidget {
  const FriendsList({
    Key? key,
    required this.friend,
  }) : super(key: key);

  final User friend;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: friend.friends.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: ElevatedButton(
              onPressed: () async {},
              child: Text(
                friend.friends[index].name,
                style: TextStyle(
                  color: black,
                  fontSize: 17,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(green),
                elevation: MaterialStateProperty.all(0),
                fixedSize: MaterialStateProperty.all(
                  const Size(
                    120,
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

class FriendsLabel extends StatelessWidget {
  const FriendsLabel({
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

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Edit",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: black,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
          const Size(250, 50),
        ),
      ),
    );
  }
}

class FriendInfoCard extends StatelessWidget {
  const FriendInfoCard({
    Key? key,
    required this.friend,
  }) : super(key: key);

  final User friend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          color: lightGreen,
          border: Border.all(color: green),
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
                "Balance : ${friend.balance}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Age : ${friend.age}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Registered :${findRegiteredTime(friend.registered)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                "About : ${friend.about}",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  findRegiteredTime(String dateTime) {
    String time = dateTime.substring(20);
    String hour = time.substring(1, 3);
    String min = time.substring(5);
    String finalTime = "$hour : $min";
    return finalTime;
  }
}

class BackButtonAndName extends StatelessWidget {
  const BackButtonAndName({
    Key? key,
    required this.friend,
  }) : super(key: key);

  final User friend;

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
          friend.name,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
