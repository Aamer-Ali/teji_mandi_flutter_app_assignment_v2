import 'package:flutter/material.dart';
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/default_image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24.0,
                    )),
                SizedBox(
                  height: 40,
                ),
                Text(article.title!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
