import 'dart:io';

import 'package:elearning/src/data/repository/disney_repository_impl.dart';
import 'package:elearning/src/networking/dio_client.dart';
import 'package:elearning/src/presentation/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/disney_characters_response.dart';
import '../../data/repository/disney_repository.dart';
import '../../routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disney Characters'),
      ),
      body: GetBuilder<HomeController>(
        builder: (HomeController controller) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.allCharacters.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              CharacterData data = controller.allCharacters[index];
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.characterDetailPage,
                    arguments: data,
                  );
                },
                child: Row(
                  children: [
                    Image.network(
                      data.imageUrl,
                      width: 120,
                      height: 120,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        data.name,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
