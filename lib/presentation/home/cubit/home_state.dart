import 'package:cred/domain/home/entities/data_entity.dart';

class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}

class HomeLoaded extends HomeState {
  final DataEntity dataEntity;

  HomeLoaded({required this.dataEntity});
}

class HomeLoading extends HomeState {}

abstract class HomeState {}
