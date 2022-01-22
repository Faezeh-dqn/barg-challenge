import 'package:challenge/models/user.dart';
import 'package:challenge/viewmodels/main_page_viewmodel.dart';
import 'package:challenge/views/owner_profile_page.dart';
import 'package:challenge/views/theme/colorsPalette.dart';
import 'package:challenge/views/widgets/main_skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    mainController.onInit();

    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: mainController,
          builder: (controller) => (mainController.isLoading == false)
              ? Column(
                  children: [
                    OwnerInformation(owner: mainController.owner),
                    UsersList(mainController: mainController),
                  ],
                )
              : const MainSkeletonWidget(),
        ),
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({
    Key? key,
    required this.mainController,
  }) : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    String url =
        "https://www.ssrl-uark.com/wp-content/uploads/2014/06/no-profile-image.png";
    return Expanded(
      child: ListView.builder(
        itemCount: mainController.users.length,
        itemBuilder: (context, index) {
          User user = mainController.users[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: CircleAvatar(
                            backgroundImage: (user.picture.isEmpty)
                                ? NetworkImage(url)
                                : NetworkImage(user.picture),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              user.email,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 3,
                      ),
                      child: Text(
                        user.address,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class OwnerInformation extends StatelessWidget {
  const OwnerInformation({
    Key? key,
    required this.owner,
  }) : super(key: key);

  final User owner;

  @override
  Widget build(BuildContext context) {
    String url =
        "https://www.ssrl-uark.com/wp-content/uploads/2014/06/no-profile-image.png";
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.amber.shade400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              child: SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundImage: (owner.picture.isEmpty)
                      ? NetworkImage(url)
                      : NetworkImage(owner.picture),
                ),
              ),
              onTap: () => Get.to(
                const OwnerProfilePage(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              owner.name,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
