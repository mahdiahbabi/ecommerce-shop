part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}



class AuthStarted extends AuthEvent{
   int loginMode ;

  AuthStarted(this.loginMode);
}


class BottonClicked extends AuthEvent {
  final String userName;
  final String password;
  final String ? name;
  final String ? email;
  

   int loginMode;

  BottonClicked({ required this.userName,required this.password,required this.loginMode, this.name, this.email});
}

