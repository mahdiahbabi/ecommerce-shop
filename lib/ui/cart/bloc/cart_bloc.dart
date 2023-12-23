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
      var boxList = box.values.toList();

      try {
        if (event is CheckOutButton) {
          if (boxList.first.accessToken.isNotEmpty) {
            emit(CartCheckOytSuccess());
          }
        } else if (event is CartIncreaseDecreseButton) {
          emit(CartLoading());
          var boxProductv = productBox.values.toList()[event.index];
          boxProductv.amount += event.value;
          productBox.putAt(event.index, boxProductv);
          emit(CartSuccess());
        }if (event is ItemDelete) {
          productBox.deleteAt(event.index);
          emit(CartSuccess());
        }
      } catch (e) {
        emit(CartEror());
      }
    });
  }
}
