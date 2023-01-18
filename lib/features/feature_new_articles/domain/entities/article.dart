import 'package:equatable/equatable.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/entities/source.dart';

class Article extends Equatable {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  dynamic content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];

  @override
  bool? get stringify => true;
}
