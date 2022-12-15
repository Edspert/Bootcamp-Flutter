import 'package:elearning/src/presentation/character_detail/character_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CharacterDetailController>(builder: (CharacterDetailController controller) {
      return Scaffold(
        appBar: AppBar(title: Text(controller.data.name)),
        body: Column(
          children: [
            Image.network(
              controller.data.imageUrl,
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
            Text(controller.data.name),
          ],
        ),
      );
    });
  }
}
