import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/config/app_routes.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/color_constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/display/state_managment/articles/news_articles_bloc.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/display/widgets/article_app_bar.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/display/widgets/article_card.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      appBar: const ArticleAppBar(appBarTitle: "Headlines"),
      body: Center(
        child: BlocBuilder<NewsArticlesBloc, NewsArticlesState>(
          builder: (context, state) {
            if (state is NewsArticlesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NewsArticlesDoneState) {
              return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.kArticleDetailsRoute,
                      arguments: state.articles[index]),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0),
                      child: ArticleCard(
                        article: state.articles[index],
                      )),
                ),
              );
            }
            if (state is NewsArticlesFailureState) {
              return Center(child: Text(state.message));
            }
            if (state is NewsArticlesFailureState) {
              return Center(child: Text(state.message));
            }
            return const Text("There is Some problem");
          },
        ),
      ),
    );
  }
}
