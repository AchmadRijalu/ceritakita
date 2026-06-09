class StoriesModel {
  final bool error;
  final String message;
  final List<StoryResult> listStory;

  StoriesModel({
    required this.error,
    required this.message,
    required this.listStory,
  });

  factory StoriesModel.fromJson(Map<String, dynamic> json) {
    return StoriesModel(
      error: json['error'],
      message: json['message'],
      listStory: (json['listStory'] as List)
          .map((e) => StoryResult.fromJson(e))
          .toList(),
    );
  }
}

class StoryResult {
  final String id;
  final String name;
  final String description;
  final String photoUrl;
  final DateTime createdAt;
  final double? lat;
  final double? lon;

  StoryResult({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    this.lat,
    this.lon,
  });

  factory StoryResult.fromJson(Map<String, dynamic> json) {
    return StoryResult(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      photoUrl: json['photoUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );
  }
}