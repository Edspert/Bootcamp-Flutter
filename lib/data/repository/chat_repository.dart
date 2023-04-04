import '../model/chat_item.dart';

abstract class ChatRepository {
  Future<List<ChatItem>> get messages;
}

class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<List<ChatItem>> get messages async {
    final first = DateTime.now();
    final second = first.add(const Duration(minutes: -1));
    final third = second.add(const Duration(minutes: -1));
    final four = third.add(const Duration(minutes: -1));
    final five = four.add(const Duration(minutes: -1));
    final six = five.add(const Duration(minutes: -1));

    final messages = [
      ChatItem(
        content: 'Halo semua saya Andika dari SMAN 1 Yogyakarta.',
        id: 1,
        name: 'Naufal',
        dateTime: first,
      ),
      ChatItem(
        content: 'Halo semua saya Andika dari SMAN 2 Yogyakarta.',
        id: 2,
        name: 'Bayu',
        dateTime: second,
      ),
      ChatItem(
        content: 'Halo semua saya Andika dari SMAN 3 Yogyakarta.',
        id: 3,
        name: 'Karina',
        dateTime: third,
      ),
      ChatItem(
        content: 'Halo semua saya Andika dari SMAN 4 Yogyakarta.',
        id: 4,
        name: 'Andy',
        dateTime: four,
      ),
      ChatItem(
        content: 'Baik Kak, terimakasih',
        id: 5,
        name: 'Chandra',
        dateTime: five,
        isSender: true,
      ),
      ChatItem(
        content: 'Halo, Perkenalkan saya Arin yang akan menjadi pembimbing kalian di grub ini.',
        id: 6,
        name: 'Arin',
        dateTime: six,
        isTutor: true,
      ),
    ];

    return messages;
  }
}
