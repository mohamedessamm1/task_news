part of 'home_manager_cubit.dart';

@immutable
sealed class HomeManagerState {}

final class HomeManagerInitial extends HomeManagerState {}
final class GetNewsSuccessState extends HomeManagerState {}
