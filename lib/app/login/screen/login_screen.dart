import 'package:animate_do/animate_do.dart';
import 'package:baseproj/app/login/controller/login_controller.dart';
import 'package:baseproj/common_widget/custome_text.dart';
import 'package:baseproj/core/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widget/custome_dialogbox.dart';

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
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            child: Card(
                              color: Theme.of(context).colorScheme.onPrimary,
                              elevation: 5,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: const TextField(
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          hintText: "Email or Phone number",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    // decoration: BoxDecoration(
                                    //     border: Border(
                                    //         bottom: BorderSide(
                                    //             color: Colors.grey.shade200))),
                                    child: const TextField(
                                      obscureText: true,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1500),
                            child: CustomeText(
                              text: "Forgot Password?",
                              color: Colors.grey.shade700,
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: ElevatedButton(
                              onPressed: () => showCustomDialog(),
                              child: Center(
                                child: CustomeText(
                                  text: "Login",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(color: AppColors.whiteColor),
                                ),
                              ),
                            )),
                      ],
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
