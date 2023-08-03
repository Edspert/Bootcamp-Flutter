import 'package:flutter/material.dart';

import '../../../core/values/colors.dart';

class HomeTopBannerWidget extends StatelessWidget {
  const HomeTopBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 26,
            child: SizedBox(
              child: Text(
                'Mau kerjain\nlatihan soal\napa hari ini?',
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset('assets/images/img_edspert_logo_white.png'),
          ),
        ],
      ),
    );
  }
}
