// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/data/auth.dart';
import 'package:ecommerce_shop/data/repo/auth_repo.dart';
import 'package:ecommerce_shop/utitlity/appexception.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
     

        try {
          if (event is BottonClicked && event.loginMode == 1) {
           final resualt=await  authRepository.remotDatasource.login(event.userName, event.password);
           
             final accessToken = resualt.accessToken;
            final refreshToken = resualt.refreshToken;
            await authRepository.writhDataBase(accessToken, refreshToken);
            emit(AuthSuccess(accessToken, refreshToken, 'success login'));
          } else if(event is BottonClicked && event.loginMode == 0) {
        final resualt = await authRepository.signup(event.name ?? '', event.email ??'', event.password,);
            final accessToken = resualt.accessToken;
            final refreshToken = resualt.refreshToken;
               await authRepository.writhDataBase(accessToken, refreshToken);
            emit(AuthSuccess(accessToken, refreshToken, 'success sign up'));
          }
        } catch (e) {
          
          emit(AuthEror(AppException('wrong username or password')));
        }
      
    });
  }
}
