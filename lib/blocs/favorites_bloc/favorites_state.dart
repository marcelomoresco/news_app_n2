// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitialState extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState {}

class FavoritesLoadedState extends FavoritesState {
  final FavoritesModel favoritesList;

  const FavoritesLoadedState({
    this.favoritesList = const FavoritesModel(),
  });

  @override
  List<Object> get props => [favoritesList];
}

class FavoritesErrorState extends FavoritesState {
  final String errorMessage;

  const FavoritesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
