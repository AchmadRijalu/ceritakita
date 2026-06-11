import 'dart:convert';
import 'dart:io';

import 'package:ceritakita/Utils/result.dart';
import 'package:ceritakita/models/detail_story_model.dart';
import 'package:ceritakita/models/form/add_new_story_form_model.dart';
import 'package:ceritakita/models/stories_model.dart';
import 'package:ceritakita/services/auth_repository.dart';
import 'package:ceritakita/shared/shared_values.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

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

  Future<Result<String>> addNewStory(AddNewStoryFormModel form) async {
    try {
      final token = await _authRepository.getToken();
      if (token.isEmpty) {
        return Failure('Not authenticated');
      }

      final photo = form.photo;
      if (photo == null) {
        return Failure('Photo is required');
      }

      final headline = form.headline?.trim() ?? '';
      final story = form.description?.trim() ?? '';
      String description;

      if (headline.isEmpty) {
        description = story;
      } else if (story.isEmpty) {
        description = headline;
      } else {
        description = '$headline\n\n$story';
      }

      if (description.isEmpty) {
        return Failure('Story description is required');
      }

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/stories'),
      );
      request.headers['Authorization'] = token;
      final photoFile = await _compressPhoto(photo.path);
      request.files.add(
        await http.MultipartFile.fromPath('photo', photoFile.path),
      );
      request.fields['description'] = description;

      if (form.lat != null) {
        request.fields['lat'] = form.lat.toString();
      }
      if (form.lon != null) {
        request.fields['lon'] = form.lon.toString();
      }

      final streamedResponse = await _client.send(request);
      final response = await http.Response.fromStream(streamedResponse);
      final body = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(
          body is Map<String, dynamic>
              ? body['message'] ?? 'Story uploaded successfully'
              : 'Story uploaded successfully',
        );
      }

      return Failure(
        body is Map<String, dynamic>
            ? body['message'] ?? 'Failed to upload story'
            : 'Failed to upload story',
        statusCode: response.statusCode,
      );
    } catch (e) {
      return Failure('error: $e');
    }
  }

  Future<File> _compressPhoto(String path, {int maxBytes = 900000}) async {
    final original = File(path);
    final bytes = await original.readAsBytes();

    if (bytes.length <= maxBytes) {
      return original;
    }

    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      return original;
    }

    var quality = 85;
    var targetWidth = decoded.width > 1080 ? 1080 : decoded.width;
    List<int> compressed = bytes;

    while (compressed.length > maxBytes) {
      final resized = img.copyResize(decoded, width: targetWidth);
      compressed = img.encodeJpg(resized, quality: quality);

      if (compressed.length <= maxBytes) {
        break;
      }

      if (quality > 25) {
        quality -= 15;
      } else if (targetWidth > 480) {
        targetWidth = (targetWidth * 0.75).round();
        quality = 70;
      } else {
        break;
      }
    }

    final tempDir = await getTemporaryDirectory();
    final compressedFile = File(
      '${tempDir.path}/story_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await compressedFile.writeAsBytes(compressed);
    return compressedFile;
  }
}
