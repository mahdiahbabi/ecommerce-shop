

import 'package:ecommerce_shop/data/data_source/auth_data_source.dart';
import 'package:ecommerce_shop/utitlity/httpcilent.dart';
final authRepository = AuthRepository(AuthRemotDatasource(httpClient), AuthLocalDatasource()); 

abstract class IAuthRepository{


   Future login(String email, String password);
  Future signup(
      String name, String email, String password);
      Future writhDataBase(String accessToken, String refreshtoken);
}


class AuthRepository implements IAuthRepository{
  final AuthRemotDatasource remotDatasource;
  final AuthLocalDatasource localDatasource;

  AuthRepository(this.remotDatasource, this.localDatasource);
  @override
  Future login(String email, String password) {
   return remotDatasource.login(email, password);
  }

  @override
  Future signup(String name, String email, String password,) {
   return remotDatasource.signup(name, email, password,);
  }
  
  @override
  Future writhDataBase(String accessToken, String refreshtoken) {
    // writhe access token and refresh token on hive data base
  return localDatasource.login(accessToken, refreshtoken);
  }

  
}