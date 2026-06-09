import 'package:ceritakita/Utils/base_state_provider.dart';
import 'package:ceritakita/Utils/result.dart';
import 'package:ceritakita/models/login_model.dart';
import 'package:ceritakita/models/register_model.dart';
import 'package:ceritakita/services/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier with BaseProvider {
  final AuthRepository _authRepository;

  AuthProvider({required AuthRepository authRepository})
    : _authRepository = authRepository;

  LoginModel? loginModel;
  String? successMessage;

  Future<void> fetchLogin(String email, String password) async {
    setLoading();
    final result = await _authRepository.fetchLogin(email, password);

    switch (result) {
      case Success(:final data):
        loginModel = data;
        setSuccess();
      case Failure(:final message):
        setFailure(message);
    }
  }

  Future<void> fetchRegister(String name, String email, String password) async {
    setLoading();
    final result = await _authRepository.fetchRegister(name, email, password);

    switch (result) {
      case Success(:final data):
        successMessage = data;
        setSuccess();
      case Failure(:final message):
        setFailure(message);
    }
  }
}
