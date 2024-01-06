import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/data_base/productdata.dart';
import 'package:ecommerce_shop/utitlity/appexception.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../data_base/data.dart';

part 'cart_event.dart';
part 'cart_state.dart';

var box = Hive.box<Data>('auth');
var productBox = Hive.box<ProductData>('product');

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      try {
        var boxList = box.values.toList();
        if (event is CheckOutButton) {
          if (boxList.first.accessToken.isNotEmpty) {
            emit(CartCheckOytSuccess());
          }
        } else if (event is CartIncreaseDecreseButton) {
          emit(CartLoading());
          var boxProductv = productBox.values.toList()[event.index];
          boxProductv.amount += event.value;
          await productBox.putAt(event.index, boxProductv);
          emit(CartSuccess());
        } else if (event is ItemDelete) {
          emit(CartLoading());
          await productBox.deleteAt(event.index);
          emit(CartSuccess());
        } else if (event is CartIncreaseDecreseButton) {
          emit(CartLoading());
          var value = productBox.values.toList()[event.index];
          value.amount += 1;
          await productBox.putAt(event.index, value);
          emit(CartSuccess());
        }
        if (event is CartDecreaseDecreseButton) {
          emit(CartLoading());
          var value = productBox.values.toList()[event.index];
          value.amount -= 1;
          await productBox.putAt(event.index, value);
          emit(CartSuccess());
        }
      } catch (e) {
        emit(CartEror());
      }
    });
  }
}
