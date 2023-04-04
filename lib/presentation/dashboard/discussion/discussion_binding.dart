import 'package:edspert_chat/data/repository/chat_repository.dart';
import 'package:edspert_chat/data/repository/chat_repository_impl.dart';
import 'package:edspert_chat/presentation/get/discussion_controller.dart';
import 'package:get/get.dart';

class DiscussionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatRepository>(ChatRepositoryImpl());

    Get.put(DiscussionController(
      chatRepository: Get.find<ChatRepository>(),
    ));
  }
}
