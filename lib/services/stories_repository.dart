import 'dart:convert';

import 'package:ceritakita/Utils/result.dart';
import 'package:ceritakita/models/detail_story_model.dart';
import 'package:ceritakita/models/stories_model.dart';
import 'package:ceritakita/services/auth_repository.dart';
import 'package:ceritakita/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class StoriesRepository {
  final http.Client _client;
  final AuthRepository _authRepository;

  StoriesRepository({
    required http.Client client,
    required AuthRepository authRepository,
  }) : _client = client,
       _authRepository = authRepository;

  Future<Result<StoriesModel>> fetchStoriesList({
    int? page,
    int? size,
    int location = 0,
  }) async {
    try {
      final response = await _client.get(
        Uri.parse("$baseUrl/stories").replace(
          queryParameters: {
            if (page != null) 'page': page.toString(),
            if (size != null) 'size': size.toString(),
            'location': location.toString(),
          },
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await _authRepository.getToken(),
        },
      );

      if (response.statusCode == 200) {
        final model = StoriesModel.fromJson(json.decode(response.body));

        if (model.error) {
          return Failure(model.message);
        }

        return Success(model);
      }

      return Failure(
        jsonDecode(response.body)['message'] ?? 'Failed to fetch stories',
        statusCode: response.statusCode,
      );
    } catch (e) {
      return Failure('error: $e');
    }
  }

  Future<Result<DetailStoryModel>> fetchDetailStory(String id) async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/stories/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': await _authRepository.getToken(),
        },
      );

      if (response.statusCode == 200) {
        final detailStoryModel = DetailStoryModel.fromJson(
          jsonDecode(response.body),
        );

        if (detailStoryModel.error) {
          return Failure(detailStoryModel.message);
        }

        return Success(detailStoryModel);
      }
      return Failure(
        jsonDecode(response.body)['message'] ?? 'Failed to fetch stories',
        statusCode: response.statusCode,
      );
    } catch (e) {
      return Failure('error: $e');
    }
  }
}
