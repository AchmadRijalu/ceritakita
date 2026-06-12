import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_story_model.freezed.dart';
part 'detail_story_model.g.dart';

@freezed
abstract class DetailStoryModel with _$DetailStoryModel {
  const factory DetailStoryModel({
    required bool error,
    required String message,
    @JsonKey(name: 'story') required DetailStoryResult detailStoryResult,
  }) = _DetailStoryModel;

  factory DetailStoryModel.fromJson(Map<String, dynamic> json) =>
      _$DetailStoryModelFromJson(json);
}

@freezed
abstract class DetailStoryResult with _$DetailStoryResult {
  const factory DetailStoryResult({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    double? lat,
    double? lon,
  }) = _DetailStoryResult;

  factory DetailStoryResult.fromJson(Map<String, dynamic> json) =>
      _$DetailStoryResultFromJson(json);
}
