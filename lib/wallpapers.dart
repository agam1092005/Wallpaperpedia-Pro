import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'modals.dart';
import 'fullscreen_view.dart';

Widget wallPaper(List<PhotosModel> listPhotos, BuildContext context) {
  ScrollController controller;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        controller: controller,
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: listPhotos.map((PhotosModel photoModel) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder:
                        (context, animation, animationTime, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, animationTime) {
                      return FullScreenView(
                        imageurl: photoModel.src.portrait,
                      );
                    },
                  ),
                );
              },
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: kIsWeb
                      ? Image.network(
                          photoModel.src.portrait,
                          height: 50,
                          width: 100,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: photoModel.src.portrait,
                          placeholder: (context, url) => Container(
                                color: (Theme.of(context).scaffoldBackgroundColor == Color(0xFFFFFFFF)) ? Color(0xFFd2d2d2) : Color(0xFF303030),
                              ),
                          fit: BoxFit.cover),
                ),
              ),
            ),
          );
        }).toList()),
  );
}
