part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}



class HomeStarted extends HomeEvent{}


class HomeRefresh extends HomeEvent{}
