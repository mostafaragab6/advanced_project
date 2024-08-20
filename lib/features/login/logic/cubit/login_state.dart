import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@Freezed()
class LoginCubitState<T> with _$LoginCubitState<T> {
  const factory LoginCubitState.initial() = _Initial;

  const factory LoginCubitState.loading() = Loading;
  const factory LoginCubitState.success(T data) = Success<T>;
  const factory LoginCubitState.error(String error) = Error;
}
