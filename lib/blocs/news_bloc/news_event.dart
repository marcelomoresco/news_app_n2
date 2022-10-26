part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartNewsEvent extends NewsEvent {
  StartNewsEvent();
  @override
  List<Object?> get props => [];
}
