import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppResponse{
  static showSuccess(String message) {
    Get.snackbar("Success", message, backgroundColor: Colors.green.withOpacity(.4),);
  }
  static showError(dynamic e) {
    if (e is SocketException) {
      Get.snackbar('Error', "Unable To Connect At This Time", backgroundColor: Colors.red.withOpacity(.4));
      return;
    }
    if (e is DioError) {
      try {
        e.response!.statusCode != null
            ? Get.snackbar("Error", '${e.response!.data['message']}', backgroundColor: Colors.red.withOpacity(.4))
            : Get.snackbar('Error', "Unable To Connect At This Time", backgroundColor: Colors.red.withOpacity(.4));
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}