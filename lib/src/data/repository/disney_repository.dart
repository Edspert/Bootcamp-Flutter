import 'package:elearning/src/data/models/disney_characters_response.dart';

abstract class DisneyRepository {
  Future<List<CharacterData>> getAllCharacters({int page = 1});

  Future<List<CharacterData>> getOneCharacter({required String id});

  Future<List<CharacterData>> filterCharacters({required String keyword});
}
