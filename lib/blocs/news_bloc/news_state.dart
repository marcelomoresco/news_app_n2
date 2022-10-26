// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<Article> articleList;

  NewsLoadedState({
    required this.articleList,
  });

  @override
  List<Object?> get props => [articleList];
}

class NewsErrorState extends NewsState {
  final String errorMessage;

  NewsErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
