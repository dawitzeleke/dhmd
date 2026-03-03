import 'package:dhmd/app/components/app_button.dart';
import 'package:dhmd/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: const Text('SplashView'),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/doctor.png', fit: BoxFit.cover),
          ),

          Positioned(
            top: 20,
            left: 20,
            child: Image.asset("assets/images/defence.png",
                width: 150, height: 150, fit: BoxFit.contain
            )),

          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppButton(
                  text: "Get Started",
                  onPressed: () => {},
                  width: 260,
                  borderRadius: 60,
                  backgroundColor: AppColors.primary,
                  textSize: 24,
                  hasBorderSide: true,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
