part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class StartFavoritesEvent extends FavoritesEvent {}

class AddNewsFavoritesEvent extends FavoritesEvent {
  final Article article;
  const AddNewsFavoritesEvent({required this.article});

  @override
  List<Object> get props => [article];
}

class RemoveNewsFavoritesEvent extends FavoritesEvent {
  final Article article;
  const RemoveNewsFavoritesEvent({required this.article});

  @override
  List<Object> get props => [article];
}
