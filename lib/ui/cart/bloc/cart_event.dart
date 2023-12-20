part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class AddButtonToCart extends CartEvent{}
final class BuyButton extends CartEvent{}