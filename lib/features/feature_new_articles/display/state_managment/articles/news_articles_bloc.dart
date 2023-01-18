import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/params/article_request_params.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/entities/article.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/usecases/get_news_articles.dart';

part 'new_articles_event.dart';

part 'news_articles_state.dart';

class NewsArticlesBloc extends Bloc<NewsArticlesEvent, NewsArticlesState> {
  final GetNewsArticles _getNewsArticles;

  NewsArticlesBloc(this._getNewsArticles)
      : super(NewsArticlesInitialState()) {
    on<GetNewsArticlesEvent>((event, emit) async {
      try {
        emit(NewsArticlesLoadingState());
        final response = await _getNewsArticles.call(ArticleRequestParams());

        response!.fold(
            (newFailure) =>
                emit(NewsArticlesFailureState(newFailure.errorMessage!)),
            (newResponse) => emit(NewsArticlesDoneState(newResponse)));
      } on Exception catch (error) {
        emit(
            NewsArticlesFailureState("There is some problem Please try again"));
      }
    });
  }
}
