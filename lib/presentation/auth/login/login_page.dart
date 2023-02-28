import 'package:elearning/core/values/images.dart';
import 'package:elearning/presentation/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../routes/routes.dart';
import '../../widgets/signin_google_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
                padding: const EdgeInsets.all(32),
                child: ListView(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: '',
                      ),
                    ),
                    const SizedBox(height: 36),
                    SvgPicture.asset(
                      ImagesAssets.imageIllustrationLoginSvg,
                      height: 255,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
                      style: TextStyle(
                        color: AppColors.grey6A,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SocialLoginButton(
                      text: 'Masuk dengan Google',
                      iconAsset: ImagesAssets.iconGooglePng,
                      outlineBorderColor: AppColors.mint,
                      onPressed: () async {
                        await Get.find<LoginController>().onGoogleSignIn();
                      },
                    ),
                    const SizedBox(height: 25),
                    SocialLoginButton(
                      text: 'Masuk dengan Apple ID',
                      iconAsset: ImagesAssets.iconApplePng,
                      backgroundColor: AppColors.black,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
      ),
    );
  }
}
