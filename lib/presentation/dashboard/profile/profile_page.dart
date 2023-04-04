import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_profile_page.dart';
import 'profile_controller.dart';

class ProfilePage<C extends ProfileController> extends GetView<C> {
  static const routeName = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Akun Saya'),
      backgroundColor: const Color(0xff3A7FD5),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () => redirectToEditPage(),
          child: const Text(
            'Edit',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
      bottom: buildBottomAppBar(context),
    );
  }

  void redirectToEditPage() => Get.toNamed(EditProfilePage.routeName);

  PreferredSizeWidget buildBottomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(Get.width, 60),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Fajrin Arrahman',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'SMAN 1 Kediri',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Image.network(
                'https://cdn1-production-images-kly.akamaized.net/H6frj65JGbLKYO7MVWUlp3tD8tc=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2117358/original/087611600_1524566686-2._Steve_Jobs_-_JUSTIN_SULLIVAN__GETTY_IMAGES_NORTH_AMERICA__AFP.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 7,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.25),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 8,
                ),
                child: Text(
                  'Identitas Diri',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              buildContentProfile(
                context: context,
                title: 'Nama Lengkap',
                value: 'Muhammad Ali Topan',
              ),
              buildContentProfile(
                context: context,
                title: 'Email',
                value: 'helloaltop@gmail.com',
              ),
              buildContentProfile(
                context: context,
                title: 'Jenis Kelamin',
                value: 'Laki - laki',
              ),
              buildContentProfile(
                context: context,
                title: 'Kelas',
                value: 'XII-IPA',
              ),
              buildContentProfile(
                context: context,
                title: 'Sekolah',
                value: 'SMAN 1 Kediri',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        buildLogoutSection(
          context: context,
          onTap: () => onLogoutPressed(),
        ),
      ],
    );
  }

  Widget buildContentProfile({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLogoutSection({
    required BuildContext context,
    required GestureTapCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Icon(
                Icons.exit_to_app,
                color: Color(0xffEB5757),
              ),
              SizedBox(width: 6),
              Text(
                'Keluar',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffEB5757),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLogoutPressed() => debugPrint('onLogoutPressed');
}
