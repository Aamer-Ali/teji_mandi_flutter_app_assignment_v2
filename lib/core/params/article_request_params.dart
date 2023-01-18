import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/constants.dart';

class ArticleRequestParams {
  final String apiKey;
  final String country;
  final String category;

  ArticleRequestParams({
    this.apiKey = kBaseApiKey,
    this.country = 'us',
    this.category = 'general',
  });
}
