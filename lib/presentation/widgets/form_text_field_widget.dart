import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class FormTextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const FormTextFieldWidget({Key? key, required this.title, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.greyD6),
            ),
            hintText: hintText,
          ),
          style: const TextStyle(
            color: AppColors.black,
          ),
        )
      ],
    );
  }
}
