import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_model.freezed.dart';

@freezed
abstract class LoginFormModel with _$LoginFormModel {
  const factory LoginFormModel({
    required String email,
    required String password,
    required String token,
  }) = _LoginFormModel;
}
