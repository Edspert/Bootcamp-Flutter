import 'package:flutter/material.dart';

class HomeProfileWidget extends StatelessWidget {
  final String name;
  const HomeProfileWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.lightGreen,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hai, $name'),
              const Text('Selamat Datang!'),
            ],
          ),
          const Icon(Icons.ad_units),
        ],
      ),
    );
  }
}
