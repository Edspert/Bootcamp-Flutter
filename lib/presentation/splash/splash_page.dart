import 'package:flutter/material.dart';

import '../../core/values/images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  // static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A7FD5),
      body: Center(
        child: Image.asset(ImagesAssets.imageLogoWhitePng),
      ),
    );
  }
}
