import 'package:ceritakita/Utils/base_state_provider.dart';
import 'package:ceritakita/Utils/result.dart';
import 'package:ceritakita/models/detail_story_model.dart';
import 'package:ceritakita/models/stories_model.dart';
import 'package:ceritakita/services/stories_repository.dart';
import 'package:flutter/material.dart';

class StoriesProvider extends ChangeNotifier with BaseProvider {
  StoriesProvider({required StoriesRepository storiesRepository})
    : _storiesRepository = storiesRepository;

  final StoriesRepository _storiesRepository;

  StoriesModel? storiesModel;
  DetailStoryModel? detailStoryModel;

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
}
