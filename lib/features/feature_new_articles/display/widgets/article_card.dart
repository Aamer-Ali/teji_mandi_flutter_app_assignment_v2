import 'package:flutter/material.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/color_constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/dimensions_constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/fonts_constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/entities/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kAppBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: article.urlToImage != null
                ? Image.network(
                    article.urlToImage ?? "",
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    "images/default_image.jpg",
                    fit: BoxFit.fill,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  article.title!,
                  style: const TextStyle(
                      fontFamily: kRobotoSlab,
                      fontSize: kArticleTitleFontSize,
                      color: kArticleTitleFontColor),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  children: [
                    Text(
                      article.source!.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: kRobotoSlab,
                          fontSize: kArticleSourceNameFontSize,
                          color: kArticleDetailsFontColor),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      article.publishedAt!.split("T").first,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: kRobotoSlab,
                          fontSize: kArticleSourceNameFontSize,
                          color: kArticleDetailsFontColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
