// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoriesModel _$StoriesModelFromJson(Map<String, dynamic> json) =>
    _StoriesModel(
      error: json['error'] as bool,
      message: json['message'] as String,
      listStory: (json['listStory'] as List<dynamic>)
          .map((e) => StoryResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoriesModelToJson(_StoriesModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.listStory,
    };

_StoryResult _$StoryResultFromJson(Map<String, dynamic> json) => _StoryResult(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  photoUrl: json['photoUrl'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lat: (json['lat'] as num?)?.toDouble(),
  lon: (json['lon'] as num?)?.toDouble(),
);

Map<String, dynamic> _$StoryResultToJson(_StoryResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
    };
