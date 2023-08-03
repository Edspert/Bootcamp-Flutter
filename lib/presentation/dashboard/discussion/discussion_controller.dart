import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:elearning/presentation/dashboard/discussion/discussion_page.dart';

import '../../../data/model/chat_item.dart';
import '../../../data/repository/chat_repository.dart';

class DiscussionController extends GetxController {
  final ChatRepository _chatRepository;

  DiscussionController({
    required ChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  final ImagePicker _picker = ImagePicker();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _chatTextController = TextEditingController();

  List<ChatDataItem> messages = List.empty(growable: true);
  final _isLoadingMessages = false.obs;
  final _selectedFile = Rx<XFile?>(null);

  bool get isLoadingMessages => _isLoadingMessages.value;
  XFile? get selectedFile => _selectedFile.value;
  ScrollController get scrollController => _scrollController;
  TextEditingController get chatTextController => _chatTextController;

  void createMessage({
    required bool isMe,
    required String message,
  }) {
    messages.add(ChatDataItem(
      name: 'Fikri',
      message: message,
      time: DateTime.now(),
      isMe: isMe,
    ));
    update();
  }

  Future<void> openCamera() async {
    final cameraFile = await _picker.pickImage(source: ImageSource.camera);
    _selectedFile.value = cameraFile;
  }

  Future<void> openGallery() async {
    final galleryFile = await _picker.pickImage(source: ImageSource.gallery);
    _selectedFile.value = galleryFile;
  }
}

class ChatDataItem {
  final String name;
  final String message;
  final DateTime time;
  final bool isMe;
  ChatDataItem({
    required this.name,
    required this.message,
    required this.time,
    required this.isMe,
  });

  ChatDataItem copyWith({
    String? name,
    String? message,
    DateTime? time,
    bool? isMe,
  }) {
    return ChatDataItem(
      name: name ?? this.name,
      message: message ?? this.message,
      time: time ?? this.time,
      isMe: isMe ?? this.isMe,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'message': message,
      'time': time.millisecondsSinceEpoch,
      'isMe': isMe,
    };
  }

  factory ChatDataItem.fromMap(Map<String, dynamic> map) {
    return ChatDataItem(
      name: map['name'] ?? '',
      message: map['message'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      isMe: map['isMe'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatDataItem.fromJson(String source) => ChatDataItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatDataItem(name: $name, message: $message, time: $time, isMe: $isMe)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatDataItem &&
        other.name == name &&
        other.message == message &&
        other.time == time &&
        other.isMe == isMe;
  }

  @override
  int get hashCode {
    return name.hashCode ^ message.hashCode ^ time.hashCode ^ isMe.hashCode;
  }
}
