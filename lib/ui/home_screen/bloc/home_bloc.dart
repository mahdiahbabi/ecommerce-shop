import 'dart:developer';


import 'package:ecommerce_shop/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
        //TODO we should remove this duration
        Future.delayed(const Duration(seconds: 1));
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
