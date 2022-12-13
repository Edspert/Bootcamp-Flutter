class DisneyCharactersResponse {
  final int count;
  final int totalPages;
  final String nextPage;
  final List<CharacterData> data;

//<editor-fold desc="Data Methods">

  const DisneyCharactersResponse({
    required this.count,
    required this.totalPages,
    required this.nextPage,
    required this.data,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DisneyCharactersResponse &&
          runtimeType == other.runtimeType &&
          count == other.count &&
          totalPages == other.totalPages &&
          nextPage == other.nextPage &&
          data == other.data);

  @override
  int get hashCode => count.hashCode ^ totalPages.hashCode ^ nextPage.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'DisneyCharactersResponse{' +
        ' count: $count,' +
        ' totalPages: $totalPages,' +
        ' nextPage: $nextPage,' +
        ' data: $data,' +
        '}';
  }

  DisneyCharactersResponse copyWith({
    int? count,
    int? totalPages,
    String? nextPage,
    List<CharacterData>? data,
  }) {
    return DisneyCharactersResponse(
      count: count ?? this.count,
      totalPages: totalPages ?? this.totalPages,
      nextPage: nextPage ?? this.nextPage,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'totalPages': totalPages,
      'nextPage': nextPage,
      'data': data.map((e) => e.toMap()).toList(),
    };
  }

  factory DisneyCharactersResponse.fromMap(Map<String, dynamic> map) {
    return DisneyCharactersResponse(
      count: map['count'] as int,
      totalPages: map['totalPages'] as int,
      nextPage: map['nextPage'] as String,
      data: List<CharacterData>.from(map['data'].map((x) => CharacterData.fromMap(x))),
    );
  }

//</editor-fold>
}

class CharacterData {
  final String name;
  final String imageUrl;

//<editor-fold desc="Data Methods">

  const CharacterData({
    required this.name,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterData && runtimeType == other.runtimeType && name == other.name && imageUrl == other.imageUrl);

  @override
  int get hashCode => name.hashCode ^ imageUrl.hashCode;

  @override
  String toString() {
    return 'CharacterData{' + ' name: $name,' + ' imageUrl: $imageUrl,' + '}';
  }

  CharacterData copyWith({
    String? name,
    String? imageUrl,
  }) {
    return CharacterData(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'imageUrl': this.imageUrl,
    };
  }

  factory CharacterData.fromMap(Map<String, dynamic> map) {
    return CharacterData(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

//</editor-fold>
}
