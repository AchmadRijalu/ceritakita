class DetailStoryModel {
  final bool error;
  final String message;
  final DetailStoryResult detailStoryResult;

  DetailStoryModel({
    required this.error,
    required this.message,
    required this.detailStoryResult,
  });

  factory DetailStoryModel.fromJson(Map<String, dynamic> json) {
    return DetailStoryModel(
      error: json['error'],
      message: json['message'],
      detailStoryResult: DetailStoryResult.fromJson(json['story']),
    );
  }
}

class DetailStoryResult {
  final String id;
  final String name;
  final String description;
  final String photoUrl;
  final DateTime createdAt;
  final double? lat;
  final double? lon;

  DetailStoryResult({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
    this.lat,
    this.lon,
  });

  factory DetailStoryResult.fromJson(Map<String, dynamic> json) {
    return DetailStoryResult(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      photoUrl: json['photoUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
    );
  }
}
