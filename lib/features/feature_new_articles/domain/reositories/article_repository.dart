import 'package:dartz/dartz.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/errors/failures.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/params/article_request_params.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>>? getNewsArticle(ArticleRequestParams params);
}
