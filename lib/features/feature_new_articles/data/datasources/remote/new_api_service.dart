import 'package:teji_mandi_flutter_app_assignment_v2/core/errors/exceptions.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/data/models/news_response_model.dart';
import 'package:dio/dio.dart';

class NewsApiService {
  final Dio dio;

  NewsApiService({required this.dio});

  Future<NewsResponseModel>? getNewsArticles() async {
    final response = await dio
        .get(kBaseUrl, queryParameters: {
      "country": "us",
      "category": "business",
      "apiKey": kBaseApiKey
    });
    if (response.statusCode == 200) {
      return NewsResponseModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
