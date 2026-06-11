import 'package:ceritakita/Utils/base_state_provider.dart';
import 'package:ceritakita/Utils/result.dart';
import 'package:ceritakita/models/form/login_form_model.dart';
import 'package:ceritakita/models/login_model.dart';
import 'package:ceritakita/services/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier with BaseProvider {
  AuthProvider({required AuthRepository authRepository})
    : _authRepository = authRepository;

  final AuthRepository _authRepository;

  LoginModel? loginModel;
  LoginFormModel? currentUser;
  String? successMessage;
  bool isAuthChecked = false;

  bool get isLoggedIn => currentUser != null;

  Future<void> initialize() async {
    await getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    currentUser = await _authRepository.getCurrentUser();
    isAuthChecked = true;
    notifyListeners();
  }

  Future<void> fetchLogin(String email, String password) async {
    setLoading();
    final result = await _authRepository.fetchLogin(email, password);

    switch (result) {
      case Success(:final data):
        loginModel = data;
        await _authRepository.storeCredentialToLocal(data, email, password);
        currentUser = LoginFormModel(
          email: email,
          password: password,
          token: data.loginResult!.token,
        );
        isAuthChecked = true;
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

  Future<void> logout() async {
    await _authRepository.logout();
    loginModel = null;
    currentUser = null;
    isAuthChecked = true;
    reset();
    notifyListeners();
  }
}
