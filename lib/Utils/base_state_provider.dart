
import 'package:flutter/material.dart';

enum BaseState { initial, loading, success, failure }

mixin BaseProvider on ChangeNotifier {
  BaseState _state = BaseState.initial;
  String? _errorMessage;

  BaseState get state => _state;
  String? get errorMessage => _errorMessage;

  bool get isLoading => _state == BaseState.loading;
  bool get isSuccess => _state == BaseState.success;
  bool get isFailure => _state == BaseState.failure;

  void setLoading() {
    _state = BaseState.loading;
    _errorMessage = null;
    notifyListeners();
  }

  void setSuccess() {
    _state = BaseState.success;
    notifyListeners();
  }

  void setFailure(String message) {
    _state = BaseState.failure;
    _errorMessage = message;
    notifyListeners();
  }

  void reset() {
    _state = BaseState.initial;
    _errorMessage = null;
    notifyListeners();
  }
}