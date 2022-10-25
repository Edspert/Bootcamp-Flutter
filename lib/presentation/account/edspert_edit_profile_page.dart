import 'package:edspert_account/presentation/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';

import 'edspert_edit_profile_controller.dart';

class EdspertEditProfilePage
    extends EditProfilePage<EdspertEditProfileController> {
  const EdspertEditProfilePage({super.key});

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Edit Account'),
      centerTitle: true,
      backgroundColor: const Color(0xff3A7FD5),
    );
  }
}
