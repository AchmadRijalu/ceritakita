import 'package:ceritakita/Utils/base_state_provider.dart';
import 'package:ceritakita/Utils/result.dart';
import 'package:ceritakita/models/login_model.dart';
import 'package:ceritakita/services/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier with BaseProvider {
  final AuthRepository _authRepository;

  AuthProvider({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository();

  LoginModel? loginModel;

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
}