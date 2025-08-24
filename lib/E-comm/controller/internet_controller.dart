import 'dart:async';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter/material.dart';

class InternetController extends GetxController {
  static InternetController get instance => Get.find();
  // RxBool isOnline = true.obs; // make it observable
  // late final StreamSubscription _sub;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //
  //   _sub = InternetConnection().onStatusChange.listen((status) {
  //     bool connected = status == InternetStatus.connected;
  //     isOnline.value = connected;
  //
  //     if (!connected) {
  //       Get.snackbar(
  //         "No Internet",
  //         "You are offline",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //         duration: const Duration(seconds: 2), // stays until restored
  //       );
  //     } else {
  //       if (Get.isSnackbarOpen) {
  //         Get.closeAllSnackbars();
  //         Get.snackbar(
  //           "Back Online",
  //           "You are connected again",
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.green,
  //           colorText: Colors.white,
  //           duration: const Duration(seconds: 2),
  //         );
  //       }
  //     }
  //   });
  // }
  //
  // @override
  // void onClose() {
  //   _sub.cancel();
  //   super.onClose();
  // }
  bool? isOnline ; // nullable RxBool

  Future<void> checkConnection() async {
    bool connected = await InternetConnection().hasInternetAccess;
    print(connected);
    isOnline = connected;
  }


}
