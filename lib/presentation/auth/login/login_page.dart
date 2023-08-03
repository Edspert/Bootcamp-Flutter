import 'package:elearning/core/values/images.dart';
import 'package:elearning/presentation/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../routes/routes.dart';
import '../../widgets/social_login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.all(32.0),
    //       child: Column(
    //         children: [
    //           const Align(
    //             alignment: Alignment.centerLeft,
    //             child: Text(
    //               'Login',
    //               style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 20,
    //                 color: Color(0xFF000000),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           SvgPicture.asset(
    //             ImagesAssets.imageIllustrationLoginSvg,
    //             height: 255,
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           const Text(
    //             'Selamat Datang',
    //             style: TextStyle(
    //               fontWeight: FontWeight.w500,
    //               fontSize: 22,
    //               color: Color(0xFF000000),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 4,
    //           ),
    //           const Text(
    //             'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
    //             style: TextStyle(
    //               fontSize: 14,
    //               fontWeight: FontWeight.w500,
    //               color: Color(0xFF6A7483),
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //           const Expanded(child: SizedBox()),
    //           InkWell(
    //             onTap: () {},
    //             borderRadius: BorderRadius.circular(30),
    //             child: Ink(
    //               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    //               width: double.infinity,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(30),
    //                 border: Border.all(
    //                   color: const Color(0xFF01B1AF),
    //                 ),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     offset: Offset(0, 18),
    //                     blurRadius: 40,
    //                     spreadRadius: 0,
    //                     color: Colors.black.withOpacity(0.1496),
    //                   ),
    //                 ],
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Image.asset(
    //                     ImagesAssets.iconGooglePng,
    //                     height: 26,
    //                     width: 26,
    //                   ),
    //                   const SizedBox(width: 12),
    //                   Text(
    //                     'Masuk dengan Google',
    //                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           ElevatedButton(onPressed: () {}, child: const Text('Apple')),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            SvgPicture.asset(
              ImagesAssets.imageIllustrationLoginSvg,
              height: 255,
            ),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Selamat Datang',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
              style: TextStyle(
                color: AppColors.grey6A,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const Expanded(child: SizedBox()),
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
    );
  }
}
