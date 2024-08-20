import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  @JsonKey(name: 'data')
  SignupUserData? userData;
  bool? status;
  int? code;

  SignupResponse({this.code, this.message, this.status, this.userData});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class SignupUserData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  SignupUserData({this.token, this.userName});

  factory SignupUserData.fromJson(Map<String, dynamic> json) =>
      _$SignupUserDataFromJson(json);
}
