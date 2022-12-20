import 'package:flutter/material.dart';

import '../../core/values/colors.dart';
import '../../core/values/images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
