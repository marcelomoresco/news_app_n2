// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'article_model.dart';

class FavoritesModel extends Equatable {
  final List<Article> articlesFavorites;

  const FavoritesModel({
    required this.articlesFavorites,
  });

  @override
  List<Object?> get props => [articlesFavorites];
}
