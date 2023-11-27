part of 'home_bloc.dart';


sealed class HomeState {}

final class HomeInitial extends HomeState {}


class HomeLoading extends HomeState{}

class HomeSuccess extends HomeState{
  final List<Product> allProduct ;
  final List<Categories> allCategories ;

  HomeSuccess(this.allProduct, this.allCategories); 
}

class HomeEror extends HomeState{
final AppException appException;

  HomeEror(this.appException);

}
