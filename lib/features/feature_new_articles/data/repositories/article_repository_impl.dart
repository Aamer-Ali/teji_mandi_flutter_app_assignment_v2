import 'package:dartz/dartz.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/connections/network_info.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/errors/exceptions.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/errors/failures.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/params/article_request_params.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/data/datasources/remote/new_api_service.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/entities/article.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/reositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService newsApiService;
  final NetworkInfo networkInfo;

  ArticleRepositoryImpl(
      {required this.newsApiService, required this.networkInfo});

  @override
  Future<Either<Failure, List<Article>>>? getNewsArticle(
      ArticleRequestParams params) async {
    if (await networkInfo.isConnected!) {
      try {
        final news_response = await newsApiService.getNewsArticles();
        final articles = news_response!.articles;

        //TODO : Add data to local database
        return Right(articles!);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "This is a server exception"));
      }
    } else {
      //Todo: Get data from local database
      return Left(CacheFailure(errorMessage: "This is an exception in local source"));
    }
  }
}
