
import 'package:get/get.dart';

import '../../../data/repository/chat_repository.dart';
import 'discussion_controller.dart';

class DiscussionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatRepository>(ChatRepositoryImpl());

    Get.put(DiscussionController(
      chatRepository: Get.find<ChatRepository>(),
    ));
  }
}
