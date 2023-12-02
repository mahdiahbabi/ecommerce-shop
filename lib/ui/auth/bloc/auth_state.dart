part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class AuthSuccess extends AuthState{
  final String accessToken;
  final String refreshToken;

  AuthSuccess(this.accessToken, this.refreshToken);
}

class AuthEror extends AuthState{
  final AppException message;

  AuthEror(this.message);
}

class AuthLoading extends AuthState{}