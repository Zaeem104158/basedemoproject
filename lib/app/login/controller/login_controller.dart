import 'dart:async';
import 'dart:developer';

import 'package:baseproj/core/api_service/api_service.dart';
import 'package:baseproj/core/route/route_path.dart';
import 'package:baseproj/core/storage_service/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/snackbar/custome_snackbar.dart';
import '../../../common_widget/snackbar/top_snackbat.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  final ApiService _apiService = ApiService();
  final AppStorage appStorage = AppStorage();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool rememberMe = false.obs,
      isButtonEnabled = false.obs,
      loginLoading = false.obs;
  @override
  void onInit() async {
    rememberMe.value = await rememberMeCheck();
    super.onInit();
  }

  void updateButtonState() {
    isButtonEnabled.value = usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
    /* 
            final usernameRegex =
        RegExp(r'^[a-zA-Z0-9]{3,}$'); // Example: Alphanumeric, min 3 chars
    final passwordRegex = RegExp(
        r'^.{6,}$'); // At least 6 characters, no specific content requirement

        */
  }

  Future<bool> rememberMeCheck() async {
    var value = await appStorage.read(AppStorageKeys.rememberMe);
    if (value) {
      if (await appStorage.read(AppStorageKeys.rememberedLoginData) != null) {
        usernameController.text = await appStorage
            .read(AppStorageKeys.rememberedLoginData)["P_USERNAME"];
        passwordController.text = await appStorage
            .read(AppStorageKeys.rememberedLoginData)["P_PASSWORD"];
      }
    }
    return value;
  }

  login(context) async {
    loginLoading.value = true;
    Map<String, dynamic> request = {
      "P_USERNAME": usernameController.text,
      "P_PASSWORD": passwordController.text
    };
    if (loginFormKey.currentState?.validate() ?? false) {
      _apiService.baseUrl = ApiUrl.auth.url;

      log("$request");
      try {
        var response = await _apiService.post("/LOGIN_CO", request);
        if (response['Result'] == "Success") {
          appStorage.write(AppStorageKeys.loginUserInfo, {
            "User": response['User'],
            "MainCompany": response['MainCompany'],
            "ComId": response['ComId']
          });
          if (rememberMe.value) {
            await appStorage.write(AppStorageKeys.rememberedLoginData, {
              "P_USERNAME": usernameController.text,
              "P_PASSWORD": passwordController.text
            });
          } else {
            await appStorage.remove(AppStorageKeys.rememberedLoginData);
          }

          showTopSnackBar(
            displayDuration: const Duration(milliseconds: 1200),
            snackBarPosition: SnackBarPosition.bottom,
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Successfully login",
            ),
          );
          Get.offAllNamed(RoutePath.home);
        } else {
          showTopSnackBar(
            snackBarPosition: SnackBarPosition.bottom,
            Overlay.of(context),
            const CustomSnackBar.success(
              message: "Login Failed",
            ),
          );
        }
        loginLoading.value = false;
      } catch (error) {
        loginLoading.value = false;
        showTopSnackBar(
          snackBarPosition: SnackBarPosition.bottom,
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Login Failed",
          ),
        );
      }
    }
  }
}
