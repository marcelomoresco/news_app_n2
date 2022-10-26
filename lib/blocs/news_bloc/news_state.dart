part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {}

class NewsErrorState extends NewsState {
  final String errorMessage;

  NewsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
