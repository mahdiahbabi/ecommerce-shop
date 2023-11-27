import 'package:dio/dio.dart';
import 'package:ecommerce_shop/utitlity/validateresponse.dart';

import '../categories.dart';
import '../product.dart';

abstract class IHomeDataSource {
  Future<List<Product>> getAll();
  Future<List<Categories>> getCategories();

  Future<Product> getOne(int id);
}

class HomeRemoteDataSource implements IHomeDataSource {
  final Dio httpClient;

  HomeRemoteDataSource(this.httpClient);

  @override
  Future<List<Product>> getAll() async {
    final response = await httpClient.get('products');
    List<Product> allProduct = [];
    ValidatorResponse(response);
    if (response.data is List) {
      for (var element in response.data) {
        allProduct.add(Product.fromjson(element));
      }
    }

    return allProduct;
  }

  @override
  Future<Product> getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<List<Categories>> getCategories() async {
    final resualt = await httpClient.get('categories');
    ValidatorResponse(resualt);
    List<Categories> allCategories = [];
    if (resualt.data is List) {
    for (var item in resualt.data) {
      if (item is Map<String, dynamic>) {
        allCategories.add(Categories.fromjson(item));
      }
    }
  }


    return allCategories;
  }
}
