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

  static const int pageSize = 5;

  StoriesModel? storiesModel;
  DetailStoryModel? detailStoryModel;
  XFile? selectedPhoto;

  final List<StoryResult> _stories = [];
  int _currentPage = 1;
  bool _hasMore = true;
  bool isLoadingMore = false;
  bool isInitialLoading = false;

  List<StoryResult> get stories => List.unmodifiable(_stories);
  bool get hasMore => _hasMore;

  Future<void> fetchStoriesList() async {
    _currentPage = 1;
    _hasMore = true;
    _stories.clear();
    isInitialLoading = true;
    setLoading();

    await _loadPage(_currentPage, append: false);

    isInitialLoading = false;
  }

  Future<void> fetchMoreStories() async {
    if (!_hasMore || isLoadingMore || isInitialLoading) return;

    isLoadingMore = true;
    notifyListeners();

    await _loadPage(_currentPage + 1, append: true);

    isLoadingMore = false;
    notifyListeners();
  }

  Future<void> _loadPage(int page, {required bool append}) async {
    final result = await _storiesRepository.fetchStoriesList(
      page: page,
      size: pageSize,
      location: 0,
    );

    switch (result) {
      case Success(:final data):
        storiesModel = data;

        if (append) {
          final existingIds = _stories.map((story) => story.id).toSet();
          final newStories = data.listStory
              .where((story) => !existingIds.contains(story.id))
              .toList();

          if (newStories.isEmpty) {
            _hasMore = false;
          } else {
            _currentPage = page;
            _stories.addAll(newStories);
            _hasMore = data.listStory.length >= pageSize;
          }
        } else {
          _stories.addAll(data.listStory);
          _hasMore = data.listStory.length >= pageSize;
          setSuccess();
        }
      case Failure(:final message):
        if (append) {
          _hasMore = false;
        } else {
          setFailure(message);
        }
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

  Future<void> addNewStory(String headline, String description) async {
    setLoading();

    final result = await _storiesRepository.addNewStory(
      AddNewStoryFormModel(
        headline: headline,
        description: description,
        photo: selectedPhoto,
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
