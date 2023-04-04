import 'package:edspert_chat/presentation/get/discussion_controller.dart';
import 'package:edspert_chat/presentation/widgets/chat_item_widget.dart';
import 'package:edspert_chat/presentation/widgets/input_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// C is a generic class can referred to other class based on assignment
/// In this case other engineer can create new controller but must extends
/// from [DiscussionController]. So, you will not double lifecycle execution.
class DiscussionPage<C extends DiscussionController> extends GetView<C> {
  static const routeName = '/discussion';

  const DiscussionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context),
      body: buildBody(context),
      bottomNavigationBar: buildBottom(context),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Diskusi Soal'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingMessages) {
        return buildLoading(context);
      }

      return buildData(context);
    });
  }

  Widget buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget buildData(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final chat = controller.messages[index];
        return ChatItemWidget(chat: chat);
      },
      itemCount: controller.messages.length,
      reverse: true,
    );
  }

  Widget buildBottom(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Card(
      elevation: 16,
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
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
    debugPrint(controller.messageLength.toString());
  }
}
