import 'package:challenge/viewmodels/main_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MainSkeletonWidget extends StatelessWidget {
  const MainSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return GetBuilder(
      init: mainController,
      builder: (controller) => Column(
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.white,
              child: ListView.builder(
                  itemCount: 70,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 120,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 200,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 200,
                                            color: Colors.grey,
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
                                    child: Container(
                                      height: 30,
                                      width: 300,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
