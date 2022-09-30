import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:safqa/controllers/first_time_using_app.dart';
import 'package:safqa/controllers/login_controller.dart';
import 'package:safqa/pages/home_page.dart';
import 'package:safqa/pages/select_language_page.dart';
import 'package:safqa/pages/welcome_page.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    FirstTimeUsingAppController _firstTimeController = Get.find();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      await _firstTimeController.setFirstTimeUsing();
      if (await _firstTimeController.checkIfFirstTimeUsingApp()) {
        Get.offAll(
          () => SelectLanguagePage(),
          duration: Duration(milliseconds: 1200),
        );
      } else {
        var token = await loginController.loadToken();
        if (token != "")
          Get.offAll(
            () => HomePage(),
            duration: Duration(milliseconds: 1200),
          );
        else {
          Get.offAll(
            () => WelcomePage(),
            duration: Duration(milliseconds: 1200),
          );
        }
      }
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xff2F6782),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.49,
              0.51,
              0.9,
            ],
            colors: [
              Color(0xff2F6782),
              Colors.white.withAlpha(250),
              Colors.white.withAlpha(250),
              Color(0xff2F6782),
            ],
          )),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => SelectLanguagePage(),
                  transition: Transition.fade,
                  duration: Duration(seconds: 1),
                );
              },
              child: Hero(
                tag: "logo",
                child: Image(
                  image: AssetImage(
                    "assets/images/logo/logo.png",
                  ),
                  width: 100.0.sp,
                  height: 120.0.sp,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}