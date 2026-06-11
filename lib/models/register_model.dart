class RegisterModel {
  final bool error;
  final String message;

  RegisterModel({required this.error, required this.message});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(error: json['error'], message: json['message']);
  }
}
