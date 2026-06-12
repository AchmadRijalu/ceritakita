import 'package:freezed_annotation/freezed_annotation.dart';

part 'stories_model.freezed.dart';
part 'stories_model.g.dart';

@freezed
abstract class StoriesModel with _$StoriesModel {
  const factory StoriesModel({
    required bool error,
    required String message,
    required List<StoryResult> listStory,
  }) = _StoriesModel;

  factory StoriesModel.fromJson(Map<String, dynamic> json) =>
      _$StoriesModelFromJson(json);
}

@freezed
abstract class StoryResult with _$StoryResult {
  const factory StoryResult({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    double? lat,
    double? lon,
  }) = _StoryResult;

  factory StoryResult.fromJson(Map<String, dynamic> json) =>
      _$StoryResultFromJson(json);
}
