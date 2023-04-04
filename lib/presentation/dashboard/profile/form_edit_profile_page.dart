import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_profile_controller.dart';

class FormEditProfilePage<C extends EditProfileController>
    extends GetWidget<C> {
  const FormEditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Data Diri',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            readOnly: true,
            controller: controller.etGender,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.arrow_drop_down),
              labelText: 'Jenis Kelamin',
              hintText: 'Pilih Jenis Kelamin',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onTap: () => Get.bottomSheet(chooseGender(context)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Kelas',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Sekolah',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ElevatedButton(
            onPressed: () => onUpdateData(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff3A7FD5),
            ),
            child: const Text('Perbarui Data'),
          ),
        ),
      ],
    );
  }

  void onUpdateData() {
    debugPrint('Ditekan onUpdateData');
    Get.back();
  }

  Widget chooseGender(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Laki - laki'),
            onTap: () => controller.onSelectedGender(
              value: true,
              onSelected: () => Get.back(),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('Perempuan'),
            onTap: () => controller.onSelectedGender(
              value: false,
              onSelected: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}
