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
  int index = 0;
  final List<Article> completeArticles = [];
  final List<Article> subList = [];

  NewsArticlesBloc(this._getNewsArticles) : super(NewsArticlesInitialState()) {
    on<GetNewsArticlesEvent>((event, emit) async {
      try {
        emit(NewsArticlesLoadingState());
        final response = await _getNewsArticles.call(ArticleRequestParams());
        index = 0;
        completeArticles.clear();
        subList.clear();
        response!.fold(
                (newFailure) =>
                emit(NewsArticlesFailureState(newFailure.errorMessage!)),
                (newResponse) {
              completeArticles.addAll(newResponse);
              for (int i = index; i < 5; i++) {
                subList.add(completeArticles[i]);
                index = i;
              }
              index++;
              emit(NewsArticlesDoneState(subList));
            });
      } on Exception catch (error) {
        emit(
            NewsArticlesFailureState("There is some problem Please try again"));
      }
    });

    on<GetMoreArticles>((event, emit) async {
      if (index + 5 > completeArticles.length) {
        subList.addAll(completeArticles.sublist(index));
      } else {
        for (int i = index; i < index + 5; i++) {
          subList.add(completeArticles[i]);
        }
        index = index + 5;
      }
      emit(NewsArticlesDoneState(subList));
    });
  }
}
