import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/data/auth.dart';
import 'package:ecommerce_shop/utitlity/appexception.dart';
import 'package:ecommerce_shop/utitlity/httpcilent.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      

        try {
          if (event is BottonClicked && event.loginMode == 1) {
            final resualt = await httpClient.post('auth/login', data: {
              "email": event.userName,
              "password": event.password,
            });
            final authTokens = Auth.fromjson(resualt.data);
            final accessToken = authTokens.accessToken;
            final refreshToken = authTokens.refreshToken;
            emit(AuthSuccess(accessToken, refreshToken));
          } else if(event is BottonClicked && event.loginMode == 0) {
            final resualt = await httpClient.post('users/', data: {
              "name": event.name,
              "email": event.email,
              "password": event.password,
              "avatar": "https://api.lorem.space/image/face?w=640&h=480"
            });
            final authTokens = Auth.fromjson(resualt.data);
            final accessToken = authTokens.accessToken;
            final refreshToken = authTokens.refreshToken;
            emit(AuthSuccess(accessToken, refreshToken));
          }
        } catch (e) {
          emit(AuthEror(AppException('unknown eror')));
        }
      
    });
  }
}
