import 'dart:convert';
import 'package:ceritakita/Utils/result.dart';
import 'package:ceritakita/models/login_model.dart';
import 'package:ceritakita/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<Result<LoginModel>> fetchLogin(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        final model = LoginModel.fromJson(jsonDecode(response.body));

        if (model.error) {
          return Failure(model.message);
        }

        return Success(model);
      }

      return Failure(
        jsonDecode(response.body)['message'] ?? 'Login failed',
        statusCode: response.statusCode,
      );
    } catch (e) {
      return Failure('error: $e');
    }
  }

  Future<Result<void>> fetchRegister(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      if (response.statusCode >= 200) {
        return Success(null);
      }

      return Failure(
        jsonDecode(response.body)['message'] ?? 'Register failed',
        statusCode: response.statusCode,
      );
    } catch (e) {
      return Failure('Unexpected error: $e');
    }
  }
}
