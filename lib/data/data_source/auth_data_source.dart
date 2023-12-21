import 'package:dio/dio.dart';
import 'package:ecommerce_shop/data/auth.dart';
import 'package:ecommerce_shop/data_base/data.dart';
import 'package:hive/hive.dart';

import '../../utitlity/httpcilent.dart';

abstract class IAuthDataSource {
  Future login(String email, String password);
  Future signup(
      String name, String email, String password,);
}

class AuthRemotDatasource implements IAuthDataSource {
  final Dio httpcilent ;

  AuthRemotDatasource(this.httpcilent);
  @override
  Future<Auth> login(String email, String password) async{
    final resualt = await httpcilent.post('auth/login', data: {
              "email": email,
              "password": password,
            });
            final authTokens = Auth.fromjson(resualt.data);
           return authTokens;
  }

  @override
  Future<Auth> signup( String name, String email, String password,) async{
        final resualt = await httpcilent.post('users/', data: {
              "name": name,
              "email": email,
              "password": password,
              "avatar": "https://api.lorem.space/image/face?w=640&h=480"
            });
            final authTokens = Auth.fromjson(resualt.data);
            return authTokens;
  }
}


var box = Hive.box<Data>('auth');
class AuthLocalDatasource implements IAuthDataSource {
  @override
  Future login(String accessToken, String refreshtoken) async {
    Data data = Data(accessToken, refreshtoken);
    await box.add(data);
  
  }

  @override
  Future signup(String accessToken, String refreshtoken , String name , ) async {
   throw Exception;
}
}