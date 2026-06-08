
class LoginModel {
  final bool error;
  final String message;
  final LoginResult? loginResult;

  LoginModel({
    required this.error,
    required this.message,
    this.loginResult,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      error: json['error'],
      message: json['message'],
      loginResult: json['loginResult'] != null
          ? LoginResult.fromJson(json['loginResult'])
          : null,
    );
  }
}

class LoginResult {
  final String userId;
  final String name;
  final String token;

  LoginResult({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      userId: json['userId'],
      name: json['name'],
      token: json['token'],
    );
  }
}