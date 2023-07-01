import 'dart:developer';

import 'package:fitflo_v2_1/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/user_model.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  var userList = [].obs;
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;

  getUserData() {
    AuthRepository.getUserData().listen((event) {
      userList.value = List.generate(event.docs.length,
          (index) => UserModel.fromJson(event.docs[index].data()));
      log(userList.length.toString());
      String firstName = userList[0].name!;
      var splitName = firstName.split(' ');
      firstNameController.value.text = splitName[0];
      lastNameController.value.text = splitName[1];

    });
    
    // AuthRepository().getUserData();
  }
}
