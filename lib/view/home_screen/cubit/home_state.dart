part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class RefreshHomeCubit extends HomeState {}

class GetHomeProductsLoadingState extends HomeState {}

class GetHomeProductsSuccessState extends HomeState {}

class GetHomeProductsFailureState extends HomeState {
  final String message;

  GetHomeProductsFailureState({required this.message});
}