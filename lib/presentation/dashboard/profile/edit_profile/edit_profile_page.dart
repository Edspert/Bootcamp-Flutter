import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_profile_controller.dart';
import 'form_edit_profile_page.dart';

class EditProfilePage<C extends EditProfileController> extends GetView<C> {
  static const routeName = '/profile/edit';

  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Edit Akun'),
      centerTitle: true,
      backgroundColor: const Color(0xff3A7FD5),
    );
  }

  Widget buildBody(BuildContext context) {
    return FormEditProfilePage<C>();
  }
}
