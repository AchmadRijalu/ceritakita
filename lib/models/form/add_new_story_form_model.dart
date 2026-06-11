import 'package:image_picker/image_picker.dart';

class AddNewStoryFormModel {
  final String? headline;
  final String? description;
  final XFile? photo;
  final double? lat;
  final double? lon;

  AddNewStoryFormModel({
    this.headline,
    this.description,
    this.photo,
    this.lat,
    this.lon,
  });
}
