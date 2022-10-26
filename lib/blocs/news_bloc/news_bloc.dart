import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_app_n2/service/api_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiService apiService;

  NewsBloc({required this.apiService}) : super(NewsInitialState()) {
    on<StartNewsEvent>(_onStartNewsRequestEvent);
  }

  void _onStartNewsRequestEvent(StartNewsEvent event, Emitter<NewsState> emit) {
    emit(NewsLoadingState());
  }
}
