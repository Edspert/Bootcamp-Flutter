import 'package:elearning/src/data/repository/disney_repository_impl.dart';
import 'package:elearning/src/networking/dio_client.dart';
import 'package:flutter/material.dart';

import '../data/models/disney_characters_response.dart';
import '../data/repository/disney_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DisneyRepository repository = DisneyRepositoryImpl(dioClient: DioClientImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disney Characters'),
      ),
      body: FutureBuilder<List<CharacterData>>(
        future: _getDisneyCharacters(),
        builder: (context, AsyncSnapshot<List<CharacterData>> snapshot) {
          List<CharacterData> data = snapshot.data ?? [];
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.network(
                    data[index].imageUrl,
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(child: Text(data[index].name)),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Future<List<CharacterData>> _getDisneyCharacters() {
    return repository.getAllCharacters();
  }
}
