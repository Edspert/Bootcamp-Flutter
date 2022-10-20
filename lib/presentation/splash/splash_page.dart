import 'package:flutter/material.dart';

import '../../core/values/colors.dart';
import '../../core/values/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TextEditingController emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(ImagesAssets.imageLogoWhitePng),
      ),
    );
  }
}
