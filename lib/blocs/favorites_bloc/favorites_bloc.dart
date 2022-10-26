import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_n2/models/article_model.dart';

import '../../models/favorites_model.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitialState()) {
    on<AddNewsFavoritesEvent>(_onAddNewsFavoritesEvent);
    on<RemoveNewsFavoritesEvent>(_onRemoveNewsFavoritesEvent);
  }

  void _onAddNewsFavoritesEvent(
      AddNewsFavoritesEvent event, Emitter<FavoritesState> emit) {
    emit(FavoritesLoadingState());
    final state = this.state;
    if (state is FavoritesLoadedState) {
      try {
        emit(
          FavoritesLoadedState(
            favoritesList: FavoritesModel(
              articlesFavorites:
                  List.from(state.favoritesList.articlesFavorites)
                    ..add(event.article),
            ),
          ),
        );
      } catch (e) {
        emit(
          const FavoritesErrorState(
              errorMessage: "Erro ao Adicionar esse filme aos Favoritos"),
        );
      }
    }
  }

  void _onRemoveNewsFavoritesEvent(
      RemoveNewsFavoritesEvent event, Emitter<FavoritesState> emit) {
    emit(FavoritesLoadingState());
    final state = this.state;
    if (state is FavoritesLoadedState) {
      try {
        emit(
          FavoritesLoadedState(
            favoritesList: FavoritesModel(
              articlesFavorites:
                  List.from(state.favoritesList.articlesFavorites)
                    ..remove(event.article),
            ),
          ),
        );
      } catch (e) {
        emit(
          const FavoritesErrorState(
              errorMessage: "Erro ao Adicionar esse filme aos Favoritos"),
        );
      }
    }
  }
}
