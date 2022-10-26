import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
  }

  void _onRemoveNewsFavoritesEvent(
      RemoveNewsFavoritesEvent event, Emitter<FavoritesState> emit) {
    emit(FavoritesLoadingState());
  }
}
