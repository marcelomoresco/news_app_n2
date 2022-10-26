import '../models/article_model.dart';

class ApiService {
  final api_url =
      'https://newsapi.org/v2/top-headlines?country=br&category=business&apiKey=48c851ffeb594c48a314133eab017cb9';

  Future<List<Article>> getBrasilNewsFromApi() async {}
}
