


import 'package:dio/dio.dart';

abstract class ICartDataSource {
  Future<void> checkSesionIsValid();

}




class CartDtatXource  implements ICartDataSource{
  final Dio httpClient;

  CartDtatXource(this.httpClient);
  @override
  Future<void> checkSesionIsValid() {
   return httpClient.get('');
  }



}