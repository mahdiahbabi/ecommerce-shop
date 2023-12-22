part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartEror extends CartState{
  late final AppException appException;
}
final class CartSuccess extends CartState{}
final class CartLoading extends CartState{}
final class CartCheckOytSuccess extends CartState{}
