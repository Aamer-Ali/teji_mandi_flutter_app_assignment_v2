import 'package:dartz/dartz.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/errors/failures.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/params/article_request_params.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/entities/article.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/reositories/article_repository.dart';

class GetNewsArticles {
  final ArticleRepository _repository;

  GetNewsArticles(this._repository);

  Future<Either<Failure, List<Article>>?>? call(
      ArticleRequestParams params) async {
    final response = await _repository.getNewsArticle(params);
    return response;
  }
}
