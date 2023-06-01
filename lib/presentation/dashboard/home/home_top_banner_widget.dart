import 'package:flutter/material.dart';

import '../../../core/values/colors.dart';

class HomeTopBannerWidget extends StatelessWidget {
  const HomeTopBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          const Positioned(
            top: 26,
            left: 20,
            child: Text('Mau kerjain latihan soal apa hari ini?'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/images/img_edspert_logo_white.png'),
          ),
        ],
      ),
    );
  }
}
