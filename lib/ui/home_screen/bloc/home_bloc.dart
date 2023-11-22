import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/product.dart';
import '../../../utitlity/appexception.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        emit(HomeLoading());
        Future.delayed(Duration(seconds: 2));
        try {
          var resualt = await homeRepository.getAll();
          emit(HomeSuccess(resualt));
        } catch (e) {
          log(e.toString());
          emit(HomeEror(AppException('please check your network connection ')));
        }
      }
    });
  }
}
