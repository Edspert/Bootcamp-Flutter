import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/model/chat_item.dart';
import '../../../data/repository/chat_repository.dart';

class DiscussionController extends GetxController {
  final ChatRepository _chatRepository;

  DiscussionController({
    required ChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  final ImagePicker _picker = ImagePicker();

  final _messages = Rx<List<ChatItem>>([]);
  final _isLoadingMessages = false.obs;
  final _selectedFile = Rx<XFile?>(null);

  List<ChatItem> get messages => _messages.value;
  bool get isLoadingMessages => _isLoadingMessages.value;
  XFile? get selectedFile => _selectedFile.value;

  @override
  void onReady() async {
    super.onReady();
    await retrieveMessages;
  }

  Future<void> get retrieveMessages async {
    _isLoadingMessages.value = true;
    final values = await _chatRepository.messages;
    await Future.delayed(const Duration(seconds: 2));
    _messages.value = values;
    _isLoadingMessages.value = false;
  }

  Future<void> openCamera() async {
    final cameraFile = await _picker.pickImage(source: ImageSource.camera);
    _selectedFile.value = cameraFile;
  }

  Future<void> openGallery() async {
    final galleryFile = await _picker.pickImage(source: ImageSource.gallery);
    _selectedFile.value = galleryFile;
  }

  int get messageLength => _messages.value.length;
}
