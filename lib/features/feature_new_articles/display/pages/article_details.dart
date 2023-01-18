import 'package:flutter/material.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/color_constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/dimensions_constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/fonts_constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/features/feature_new_articles/domain/entities/article.dart';

class ArticleDetails extends StatelessWidget {
  ArticleDetails({Key? key, required this.article}) : super(key: key);
  Article article;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: article.urlToImage == null
                  ? const AssetImage("images/default_image.jpg")
                      as ImageProvider
                  : NetworkImage(article.urlToImage!),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                child: Opacity(
                    opacity: 0.7,
                    child: FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    )),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        article.title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: kRobotoSlab,
                            fontSize: kArticleTitleFontSizeDetailsPage,
                            color: kArticleTitleFontColor),
                      ),
                      const SizedBox(
                        height: 64.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article.source!.name!,
                            style: const TextStyle(
                                fontFamily: kRobotoSlab,
                                fontSize: kArticleTitleFontSize,
                                color: kArticleTitleFontColor),
                          ),
                          Text(
                            article.publishedAt!.split("T").first,
                            style: const TextStyle(
                                fontFamily: kRobotoSlab,
                                fontSize: kArticleTitleFontSize,
                                color: kArticleTitleFontColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        article.content!,
                        style: const TextStyle(
                            fontFamily: kRobotoSlab,
                            fontSize: kArticleDetailsFontSizeDetailsPage,
                            color: kArticleDetailsFontColor),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
