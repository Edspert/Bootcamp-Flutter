import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final etGender = TextEditingController();

  final _selectedGender = Rx<bool?>(null);

  bool? get selectedGender => _selectedGender.value;

  void onSelectedGender({
    required bool value,
    Function? onSelected,
  }) {
    _selectedGender.value = value;
    etGender.text = (value) ? 'Laki - laki' : 'Perempuan';
    onSelected?.call();
  }
}
