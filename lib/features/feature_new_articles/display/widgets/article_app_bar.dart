import 'package:flutter/material.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/color_constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/dimensions_constants.dart';
import 'package:teji_mandi_flutter_app_assignment_v2/core/utils/fonts_constants.dart';


class ArticleAppBar extends StatelessWidget with PreferredSizeWidget{
  final String appBarTitle;

  const ArticleAppBar({Key? key, required this.appBarTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kAppBarBackgroundColor,
      centerTitle: true,
      title: Text(
        appBarTitle.toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: kAppBarTitleFontColor,
            fontSize: kAppBarTitleFontSize,
            fontFamily: kRobotoSlab),
      ),
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight);
}


