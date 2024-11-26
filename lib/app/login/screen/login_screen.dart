import 'package:animate_do/animate_do.dart';
import 'package:baseproj/app/login/controller/login_controller.dart';
import 'package:baseproj/common_widget/custome_text.dart';
import 'package:baseproj/core/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/custome_dialogbox.dart';
import '../../../common_widget/custome_textformfield.dart';
import '../../../common_widget/snackbar/custome_snackbar.dart';
import '../../../common_widget/snackbar/top_snackbat.dart';
import '../../../core/storage_service/app_storage.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: Get.isDarkMode
                ? [
                    AppColors.darkPrimaryColor,
                    AppColors.darkPrimaryColor.withOpacity(0.7),
                    AppColors.darkPrimaryColor.withOpacity(
                      0.3,
                    )
                  ]
                : [
                    AppColors.primaryColor,
                    AppColors.primaryColor.withOpacity(0.7),
                    AppColors.primaryColor.withOpacity(
                      0.3,
                    )
                  ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: CustomeText(
                      text: "Login",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: CustomeText(
                        text: "Welcome Back",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: AppColors.whiteColor)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.loginFormKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 60,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1400),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                child: Card(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        CustomeTextFormField(
                                          controller:
                                              controller.usernameController,
                                          onChanged: (_) =>
                                              controller.updateButtonState(),
                                          validatorText:
                                              "Please, write username",
                                          hintText: "Enter your username",
                                          textInputAction: TextInputAction.next,
                                        ),
                                        CustomeTextFormField(
                                          controller:
                                              controller.passwordController,
                                          onChanged: (_) =>
                                              controller.updateButtonState(),
                                          validatorText:
                                              "Please, write password",
                                          hintText: "Enter your passwrod",
                                          onKeyBoardPressSubmitted: (value) {
                                            controller
                                                .loginFormKey.currentState!
                                                .save();
                                            controller.login(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => Checkbox(
                                        value: controller.rememberMe.value,
                                        onChanged: (value) async {
                                          controller.rememberMe.value =
                                              !controller.rememberMe.value;
                                          final AppStorage storageService =
                                              AppStorage();

                                          await storageService.write(
                                              AppStorageKeys.rememberMe,
                                              controller.rememberMe.value);

                                          // controller.rememberMeCheck();
                                        },
                                      ),
                                    ),
                                    const CustomeText(
                                      text: "Remember Me",
                                    ),
                                  ],
                                ),
                                const CustomeText(
                                  text: "Forget Password?",
                                ),
                              ],
                            ),
                          ),
                          // RichText(
                          //   text: TextSpan(
                          //     text:
                          //         'By selecting Agree & Continue below, I agree to our ',
                          //     style: Theme.of(context).textTheme.labelMedium,
                          //     children: <TextSpan>[
                          //       TextSpan(
                          //           text: 'Terms of Service and Privacy Policy',
                          //           style: TextStyle(
                          //               color:
                          //                   Color.fromARGB(255, 71, 233, 133),
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 12)),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 40,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1600),
                              child: Obx(() => ElevatedButton(
                                    onPressed: !controller.isButtonEnabled.value
                                        ? null
                                        : () {
                                            controller
                                                .loginFormKey.currentState!
                                                .save();
                                            controller.login(context);
                                          },
                                    child: Center(
                                      child: controller.loginLoading.value
                                          ? const CircularProgressIndicator
                                              .adaptive(
                                              backgroundColor:
                                                  AppColors.whiteColor,
                                            )
                                          : CustomeText(
                                              text: "Login",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      color:
                                                          AppColors.whiteColor),
                                            ),
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showCustomDialog() {
    Get.dialog(
      const Center(child: CustomeDialogBox()),
      barrierDismissible: false,
    );
  }
}
