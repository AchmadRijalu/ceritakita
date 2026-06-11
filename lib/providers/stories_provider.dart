import 'package:ceritakita/Utils/base_state_provider.dart';
import 'package:ceritakita/Utils/result.dart';
import 'package:ceritakita/models/form/add_new_story_form_model.dart';
import 'package:ceritakita/models/detail_story_model.dart';
import 'package:ceritakita/models/stories_model.dart';
import 'package:ceritakita/services/stories_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class StoriesProvider extends ChangeNotifier with BaseProvider {
  StoriesProvider({required StoriesRepository storiesRepository})
    : _storiesRepository = storiesRepository;

  final StoriesRepository _storiesRepository;
  final ImagePicker _imagePicker = ImagePicker();

  StoriesModel? storiesModel;
  DetailStoryModel? detailStoryModel;
  XFile? selectedPhoto;

  Future<void> fetchStoriesList({
    int? page,
    int? size,
    int location = 0,
  }) async {
    setLoading();

    final result = await _storiesRepository.fetchStoriesList(
      page: page,
      size: size,
      location: location,
    );

    switch (result) {
      case Success(:final data):
        storiesModel = data;
        setSuccess();
      case Failure(:final message):
        setFailure(message);
    }
  }

  Future<void> fetchDetailStory(String id) async {
    setLoading();

    final result = await _storiesRepository.fetchDetailStory(id);

    switch (result) {
      case Success(:final data):
        detailStoryModel = data;
        setSuccess();
      case Failure(:final message):
        setFailure(message);
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final photo = await _imagePicker.pickImage(
      source: source,
      maxWidth: 1080,
      maxHeight: 1080,
      imageQuality: 70,
    );

    if (photo != null) {
      selectedPhoto = photo;
      notifyListeners();
    }
  }

  Future<void> addNewStory(
    String headline,
    String description, {
    double? lat,
    double? lon,
  }) async {
    setLoading();

    final result = await _storiesRepository.addNewStory(
      AddNewStoryFormModel(
        headline: headline,
        description: description,
        photo: selectedPhoto,
        lat: lat,
        lon: lon,
      ),
    );

    switch (result) {
      case Success():
        selectedPhoto = null;
        await fetchStoriesList();
      case Failure(:final message):
        setFailure(message);
    }
  }
}
