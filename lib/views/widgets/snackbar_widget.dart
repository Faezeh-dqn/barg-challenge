import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String message, {Color? color}) {
  Get.rawSnackbar(
    messageText: Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: color ?? Colors.red,
    borderRadius: 12,
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(12),
  );
}
