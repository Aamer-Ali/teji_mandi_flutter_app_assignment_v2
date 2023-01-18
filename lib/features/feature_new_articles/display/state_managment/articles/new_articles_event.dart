part of 'news_articles_bloc.dart';

@immutable
abstract class NewsArticlesEvent extends Equatable {}

class GetNewsArticlesEvent extends NewsArticlesEvent {
  @override
  List<Object?> get props => [];
}

class GetMoreArticles extends NewsArticlesEvent {
  @override
  List<Object?> get props => [];
}