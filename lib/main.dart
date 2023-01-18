import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/config/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/connections/network_info.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/data/datasources/remote/new_api_service.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/data/repositories/article_repository_impl.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/display/state_managment/articles/news_articles_bloc.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/reositories/article_repository.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/usecases/get_news_articles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NewsApiService>(
          create: (context) => NewsApiService(
            dio: Dio(),
          ),
        ),
        RepositoryProvider<NetworkInfo>(
          create: (context) => NetworkInfoImpl(
            DataConnectionChecker(),
          ),
        ),
        RepositoryProvider<ArticleRepository>(
          create: (context) => ArticleRepositoryImpl(
            newsApiService: context.read<NewsApiService>(),
            networkInfo: context.read<NetworkInfo>(),
          ),
        ),
        RepositoryProvider<GetNewsArticles>(
            create: (context) =>
                GetNewsArticles(context.read<ArticleRepository>())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NewsArticlesBloc>(
            create: (context) => NewsArticlesBloc(
              context.read<GetNewsArticles>(),
            )..add(
                GetNewsArticlesEvent(),
              ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: kAppTitle,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: AppRoutes.kLandingPageRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
