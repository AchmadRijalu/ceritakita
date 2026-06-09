import 'dart:convert';
import 'package:ceritakita/Utils/result.dart';
import 'package:ceritakita/models/login_form_model.dart';
import 'package:ceritakita/models/login_model.dart';
import 'package:ceritakita/models/register_model.dart';
import 'package:ceritakita/shared/shared_values.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  
  final http.Client _client;

  AuthRepository({required http.Client client}) : _client = client;

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  Future<Result<LoginModel>> fetchLogin(String email, String password) async {
    try {
      final response = await _client.post(
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

  Future<Result<String>> fetchRegister(
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await _client.post(
        Uri.parse("$baseUrl/register"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final registerModel = RegisterModel.fromJson(jsonDecode(response.body));

        if (registerModel.error) {
          return Failure(registerModel.message);
        }

        return Success(registerModel.message);
      }

      final body = jsonDecode(response.body);
      return Failure(
        body is Map<String, dynamic>
            ? body['message'] ?? 'Register failed'
            : 'Register failed',
        statusCode: response.statusCode,
      );
    } catch (e) {
      return Failure('Unexpected error: $e');
    }
  }

  Future<void> storeCredentialToLocal(
    LoginModel loginModel,
    String email,
    String password,
  ) async {
    final token = loginModel.loginResult?.token;
    await _storage.write(key: 'token', value: token);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'password', value: password);
    await _storage.write(
      key: 'name',
      value: loginModel.loginResult?.name ?? '',
    );
  }

  Future<LoginFormModel?> getCurrentUser() async {
    try {
      final token = await _storage.read(key: 'token');
      if (token == null || token.isEmpty) {
        return null;
      }

      final email = await _storage.read(key: 'email');
      final password = await _storage.read(key: 'password');

      return LoginFormModel(
        email: email ?? '',
        password: password ?? '',
        token: token,
      );
    } catch (e) {
      return null;
    }
  }

  Future<LoginFormModel?> getCredentialFromLocal() async {
    final user = await getCurrentUser();
    if (user == null) {
      throw 'Not Authenticated Yet';
    }
    return user;
  }

  Future<String> getToken() async {
    final value = await _storage.read(key: 'token');
    if (value == null || value.isEmpty) {
      return '';
    }
    return 'Bearer $value';
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }
}
