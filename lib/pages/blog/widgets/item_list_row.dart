import 'package:cactus_app/domain/entities/blog_top.dart';
import 'package:cactus_app/values/images.dart';
import 'package:cactus_app/values/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CactusListView extends StatelessWidget {
  const CactusListView({Key key, this.callback, this.blogData, this.animationController, this.animation})
      : super(key: key);

  final VoidCallback callback;
  final BlogTop blogData;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
              opacity: animation,
              child: Transform(
                transform: Matrix4.translationValues(0.0, 10 * 1.0 - animation.value, 0.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 16),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      callback();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(color: Colors.grey.withOpacity(0.6), offset: const Offset(4, 4), blurRadius: 16)
                          ]),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  AspectRatio(
                                    aspectRatio: 2,
                                    child: FadeInImage.assetNetwork(
                                        placeholder: ImageUtils.placeholderImg, image: blogData.imgPath),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(7),
                                    color: Themes.buildLightTheme().backgroundColor,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Flexible(
                                              child: Container(
                                                alignment: Alignment.bottomLeft,
                                                padding: EdgeInsets.only(right: 10),
                                                child: Text(
                                                  blogData.title,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(fontSize: 23, color: Colors.black.withOpacity(0.8)),
                                                ),
                                              ),
                                            ), // I just added one line
                                            Icon(
                                              Icons.verified_user,
                                              color: Colors.green,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10, top: 5, right: 10),
                                          child: Text(
                                            blogData.subTitle,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ));
        });
  }
}
