// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailStoryModel _$DetailStoryModelFromJson(Map<String, dynamic> json) =>
    _DetailStoryModel(
      error: json['error'] as bool,
      message: json['message'] as String,
      detailStoryResult: DetailStoryResult.fromJson(
        json['story'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DetailStoryModelToJson(_DetailStoryModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.detailStoryResult,
    };

_DetailStoryResult _$DetailStoryResultFromJson(Map<String, dynamic> json) =>
    _DetailStoryResult(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      photoUrl: json['photoUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DetailStoryResultToJson(_DetailStoryResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
    };
