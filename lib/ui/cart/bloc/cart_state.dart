part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartEror{}
final class CartSuccess{}
