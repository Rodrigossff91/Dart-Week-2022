import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(loading, (_) async {
      if (loading.isTrue) {
        await Get.dialog(
            WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            barrierDismissible: false);
      } else {
        Get.back();
      }
    });
  }
}
