part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}


final class CheckOutButton extends CartEvent{}
final class ItemDelete extends CartEvent{
  final int index;

  ItemDelete(this.index);
}
final class CartStarted extends CartEvent{}

final class CartIncreaseDecreseButton extends CartEvent{
final int index ;
final int value;

  CartIncreaseDecreseButton(this.index, this.value);

  

}


final class CartDecreaseDecreseButton extends CartEvent{
final int index ;
final int value;

  CartDecreaseDecreseButton(this.index, this.value);

  

}