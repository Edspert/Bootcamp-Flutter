import 'package:elearning/src/data/models/disney_characters_response.dart';
import 'package:elearning/src/data/repository/disney_repository.dart';
import 'package:flutter/foundation.dart';

import '../../networking/dio_client.dart';
import '../../values/urls.dart';

class DisneyRepositoryImpl implements DisneyRepository {
  final DioClient dioClient;

  const DisneyRepositoryImpl({
    required this.dioClient,
  });

  @override
  Future<List<CharacterData>> getAllCharacters({int page = 1}) async {
    try {
      final result = await dioClient.get(
        Urls.characters,
        queryParameters: {"page": page},
      );

      DisneyCharactersResponse res = DisneyCharactersResponse.fromMap(result);
      return res.data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getUserByEmail: $e, $stackTrace');
      }
      return [];
    }
  }

  @override
  Future<List<CharacterData>> filterCharacters({required String keyword}) {
    // TODO: implement filterCharacters
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterData>> getOneCharacter({required String id}) {
    // TODO: implement getOneCharacter
    throw UnimplementedError();
  }
}
