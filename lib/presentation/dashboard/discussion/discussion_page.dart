import 'dart:convert';

import 'package:elearning/core/values/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'components/chat_item_widget.dart';
import 'components/input_chat_widget.dart';
import 'discussion_controller.dart';

/// C is a generic class can referred to other class based on assignment
/// In this case other engineer can create new controller but must extends
/// from [DiscussionController]. So, you will not double lifecycle execution.
class DiscussionPage<C extends DiscussionController> extends GetView<C> {
  static const routeName = '/discussion';

  const DiscussionPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('controller.messages: ${controller.messages.length}');
    return GetBuilder<DiscussionController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Diskusi Soal'),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  bool isSender = controller.messages[index].isMe;
                  return Column(
                    crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Text(controller.messages[index].name),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(10),
                            topLeft: isSender ? const Radius.circular(10) : Radius.zero,
                            topRight: const Radius.circular(10),
                            bottomRight: isSender ? Radius.zero : const Radius.circular(10),
                          ),
                        ),
                        child: Text(controller.messages[index].message),
                      ),
                      Text(
                        '${controller.messages[index].time.difference(DateTime.now()).inMinutes.abs()}m',
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.openGallery();
                    },
                    icon: const Icon(Icons.add),
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller.chatTextController,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: const Icon(Icons.camera),
                          onTap: () {
                            controller.openCamera();
                          },
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String chat = controller.chatTextController.text;
                      controller.createMessage(
                        isMe: true,
                        message: chat,
                      );
                      controller.chatTextController.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Diskusi Soal'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: ChatData.dummyChats.length,
        itemBuilder: (context, index) {
          ChatData data = ChatData.dummyChats[index];
          return ChatBoxWidget(
            email: data.email,
            message: data.message,
            name: data.name,
            time: data.time,
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -1),
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                onTapAdd(context);
              },
              icon: const Icon(Icons.add),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () {
                      onTapCamera(context);
                    },
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Diskusi Soal'),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget _buildBottomChatOperation(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -1),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, top: bottomPadding),
        child: InputChatWidget(
          onTapAdd: () => onTapAdd(context),
          onTapCamera: () => onTapCamera(context),
          onTapSend: () => onSend(context),
        ),
      ),
    );
  }

  void onTapCamera(BuildContext context) {
    controller.openCamera();
  }

  void onSend(BuildContext context) {
    final fileName = controller.selectedFile?.name;
    debugPrint(fileName);
  }

  void onTapAdd(BuildContext context) {
    controller.openGallery();
  }
}

class ChatData {
  final String name;
  final String message;
  final DateTime time;
  final String email;
  ChatData({
    required this.name,
    required this.message,
    required this.time,
    required this.email,
  });

  static List<ChatData> dummyChats = [
    ChatData(
      email: 'juveticsatu@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'g@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'juveticsatu@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'juveticsatu@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'g@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'h@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'g@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'j@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'h@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'g@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'juveticsatu@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'f@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
    ChatData(
      email: 'f@gmail.com',
      message: 'Halo',
      name: 'Fikri',
      time: DateTime.now(),
    ),
  ];

  ChatData copyWith({
    String? name,
    String? message,
    DateTime? time,
    String? email,
  }) {
    return ChatData(
      name: name ?? this.name,
      message: message ?? this.message,
      time: time ?? this.time,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'message': message,
      'time': time.millisecondsSinceEpoch,
      'email': email,
    };
  }

  factory ChatData.fromMap(Map<String, dynamic> map) {
    return ChatData(
      name: map['name'] ?? '',
      message: map['message'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatData.fromJson(String source) => ChatData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatData(name: $name, message: $message, time: $time, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatData &&
        other.name == name &&
        other.message == message &&
        other.time == time &&
        other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^ message.hashCode ^ time.hashCode ^ email.hashCode;
  }
}

class ChatBoxWidget extends StatelessWidget {
  final String name;
  final String message;
  final DateTime time;
  final String email;

  const ChatBoxWidget({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('id', timeago.IdMessages());
    bool isMe = email == FirebaseAuth.instance.currentUser?.email;
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(name),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                topLeft: isMe ? Radius.zero : const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomLeft: const Radius.circular(10),
                bottomRight: isMe ? Radius.zero : const Radius.circular(10),
              )),
          child: Text(message),
        ),
        Text(timeago.format(time)),
      ],
    );
  }
}
