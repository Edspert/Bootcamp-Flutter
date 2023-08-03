import 'package:elearning/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_profile/edit_profile_page.dart';
import 'profile_controller.dart';

class ProfilePage<C extends ProfileController> extends GetView<C> {
  static const routeName = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Akun Saya'),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => redirectToEditPage(
                EditProfileArgs(
                  name: 'Blabla',
                  email: 'aaaaa@g.com',
                  jenisKelamin: 'Laki-laki',
                  kelas: '12',
                  sekolah: 'SMA 33 Jakarta',
                ),
              ),
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fikri',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'SMA 300 Jakarta',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(ImagesAssets.iconApplePng),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 7,
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Identitas Diri'),
                  IdentityRowWidget(
                    label: 'Nama Lengkap',
                    data: 'David Beckham',
                  ),
                  IdentityRowWidget(
                    label: 'Nama Lengkap',
                    data: 'David Beckham',
                  ),
                  IdentityRowWidget(
                    label: 'Nama Lengkap',
                    data: 'David Beckham',
                  ),
                  IdentityRowWidget(
                    label: 'Nama Lengkap',
                    data: 'David Beckham',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                onLogoutPressed();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 7,
                      spreadRadius: 0,
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    Text('Keluar'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Akun Saya'),
      backgroundColor: const Color(0xff3A7FD5),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () => redirectToEditPage(
            EditProfileArgs(
              name: 'Blabla',
              email: 'aaaaa@g.com',
              jenisKelamin: 'Laki-laki',
              kelas: '12',
              sekolah: 'SMA 33 Jakarta',
            ),
          ),
          child: const Text(
            'Edit',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
      bottom: buildBottomAppBar(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }

  void redirectToEditPage(EditProfileArgs args) => Get.toNamed(
        EditProfilePage.routeName,
        arguments: args,
      );

  PreferredSizeWidget buildBottomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(Get.width, 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
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
        const SizedBox(
          height: 20,
        ),
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              onLogoutPressed();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 6,
                      spreadRadius: 0,
                      color: Colors.black.withOpacity(0.25)),
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  Text('Keluar'),
                ],
              ),
            ),
          ),
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 6, spreadRadius: 0, offset: const Offset(0, 0))
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
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

  void onLogoutPressed() {
    Get.dialog(
      Dialog(
        child: Wrap(
          children: [
            Column(
              children: [
                const SizedBox(height: 16),
                const Text('Logout?'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 32),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Tidak'),
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                            controller.signOut();
                          },
                          child: const Text('Ya')),
                    ),
                    const SizedBox(width: 32),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
    // Get.bottomSheet(
    //   Wrap(
    //     children: [
    //       Column(
    //         children: [
    //           const SizedBox(height: 16),
    //           const Text('Logout?'),
    //           const SizedBox(height: 16),
    //           Row(
    //             children: [
    //               const SizedBox(width: 32),
    //               Expanded(
    //                 child: OutlinedButton(
    //                   onPressed: () {
    //                     Get.back();
    //                   },
    //                   child: const Text('Tidak'),
    //                 ),
    //               ),
    //               const SizedBox(width: 32),
    //               Expanded(
    //                 child: ElevatedButton(
    //                     onPressed: () {
    //                       Get.back();
    //                       controller.signOut();
    //                     },
    //                     child: const Text('Ya')),
    //               ),
    //               const SizedBox(width: 32),
    //             ],
    //           ),
    //           const SizedBox(height: 32),
    //         ],
    //       ),
    //     ],
    //   ),
    //   backgroundColor: Colors.white,
    // );
  }
}

class IdentityRowWidget extends StatelessWidget {
  final String label;
  final String data;

  const IdentityRowWidget({
    super.key,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        Text(
          data,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
