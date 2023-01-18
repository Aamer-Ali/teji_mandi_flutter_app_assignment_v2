import 'package:flutter/material.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/display/pages/article_details.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/display/pages/landing_page.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/entities/article.dart';

class AppRoutes {
  static const String kLandingPageRoute = "/";
  static const String kArticleDetailsRoute = "/article-details";

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kLandingPageRoute:
        return _materialRoute(const LandingPage());
      case kArticleDetailsRoute:
        return _materialRoute(ArticleDetails(
          article: settings.arguments! as Article,
        ));

      default:
        return null;
    }
  }

  static Route<dynamic>? _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
