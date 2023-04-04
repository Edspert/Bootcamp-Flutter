import 'package:edspert_chat/data/model/chat_item.dart';

abstract class ChatRepository {
  Future<List<ChatItem>> get messages;
}
