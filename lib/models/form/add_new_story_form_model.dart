import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'add_new_story_form_model.freezed.dart';

@freezed
abstract class AddNewStoryFormModel with _$AddNewStoryFormModel {
  const factory AddNewStoryFormModel({
    String? headline,
    String? description,
    XFile? photo,
    double? lat,
    double? lon,
  }) = _AddNewStoryFormModel;
}
