import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/data/models/articles_model.dart';

class NewsResponseModel {
  NewsResponseModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  NewsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(ArticleModel.fromJson(v));
      });
    }
  }

  String? status;
  int? totalResults;
  List<ArticleModel>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
