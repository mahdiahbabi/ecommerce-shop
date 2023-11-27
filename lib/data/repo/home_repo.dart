import 'package:ecommerce_shop/data/data_source/home_data_source.dart';
import 'package:ecommerce_shop/data/product.dart';
import 'package:ecommerce_shop/utitlity/httpcilent.dart';

import '../categories.dart';


final homeRepository = HomeRepository(HomeRemoteDataSource(httpClient));


abstract class IHomeRepository {
  Future<List<Product>> getAll();
 Future<List<Categories>> getCategories();
  Future<Product> getOne(int id);
}

class HomeRepository implements IHomeRepository {
  final HomeRemoteDataSource dataSource;

  HomeRepository(this.dataSource);
  @override
  Future<List<Product>> getAll() {
    return dataSource.getAll();
  }

  @override
  Future<Product> getOne(int id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
  
  
  @override
  Future<List<Categories>> getCategories() => dataSource.getCategories();
}
