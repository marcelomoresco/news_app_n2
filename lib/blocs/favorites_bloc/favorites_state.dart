part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitialState extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState {}

class FavoritesLoadedState extends FavoritesState {}

class FavoritesErrorState extends FavoritesState {
  final String errorMessage;

  FavoritesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}