import 'package:dio/dio.dart';

import '../models/article_model.dart';

class ApiService {
  final api_url =
      'https://newsapi.org/v2/top-headlines?country=br&category=business&apiKey=48c851ffeb594c48a314133eab017cb9';
  Dio _dio = Dio();

  Future<List<Article>> getBrasilNewsFromApi() async {
    final response = await _dio.get(api_url);

    if (response.statusCode == 200) {
      var result = response.data['articles'] as List;
      List<Article> articleList = result
          .map(
            (article) => Article.fromJson(article),
          )
          .toList();
      return articleList;
    } else {
      throw Exception("Erro ao consultar API");
    }
  }
}
