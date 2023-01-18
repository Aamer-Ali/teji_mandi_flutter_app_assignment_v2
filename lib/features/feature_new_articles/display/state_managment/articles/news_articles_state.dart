part of 'news_articles_bloc.dart';

@immutable
abstract class NewsArticlesState extends Equatable {}

class NewsArticlesInitialState extends NewsArticlesState {
  @override
  List<Object?> get props => [];
}

class NewsArticlesLoadingState extends NewsArticlesState {
  @override
  List<Object?> get props => [];
}

class NewsArticlesDoneState extends NewsArticlesState {
  List<Article> articles;

  NewsArticlesDoneState(this.articles);

  @override
  List<Object?> get props => [articles];
}

class NewsArticlesFailureState extends NewsArticlesState {
  String message;

  NewsArticlesFailureState(this.message);

  @override
  List<Object?> get props => [message];
}
