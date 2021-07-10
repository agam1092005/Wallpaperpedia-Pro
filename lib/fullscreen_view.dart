import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class FullScreenView extends StatefulWidget {
  final String imageurl;
  const FullScreenView({Key key, this.imageurl}) : super(key: key);

  @override
  _FullScreenViewState createState() => _FullScreenViewState();
}

class _FullScreenViewState extends State<FullScreenView> {
  // ignore: non_constant_identifier_names
  Future<void> SetWallpaperHomeScreen() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    print(result);
  }

  // ignore: non_constant_identifier_names
  Future<void> SetWallpaperLockScreen() async {
    int location = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    print(result);
  }

  // ignore: non_constant_identifier_names
  Future<void> SetWallpaperBoth() async {
    int location = WallpaperManager.BOTH_SCREENS;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageurl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FocusedMenuHolder(
                            child: Icon(
                              Icons.photo_library_outlined,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                            openWithTap: true,
                            duration: Duration(milliseconds: 500),
                            menuItemExtent: 50,
                            animateMenuItems: true,
                            menuItems: <FocusedMenuItem>[
                              FocusedMenuItem(
                                backgroundColor: Theme.of(context).primaryColor,
                                trailingIcon: Icon(
                                  Icons.home_outlined,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                title: Text(
                                  'Set as Homescreen wallpaper',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {
                                  SetWallpaperHomeScreen();
                                },
                              ),
                              FocusedMenuItem(
                                backgroundColor: Theme.of(context).primaryColor,
                                trailingIcon: Icon(
                                  Icons.phonelink_lock,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                title: Text(
                                  'Set as Lockscreen wallpaper',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {
                                  SetWallpaperLockScreen();
                                },
                              ),
                              FocusedMenuItem(
                                backgroundColor: Theme.of(context).primaryColor,
                                trailingIcon: Icon(
                                  Icons.phone_android_outlined,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                title: Text(
                                  'Set wallpaper for Both',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {
                                  SetWallpaperBoth();
                                },
                              ),
                            ],
                            blurSize: 3,
                            onPressed: () {},
                            blurBackgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                          IconButton(
                            icon: Icon(Icons.download_outlined),
                            splashRadius: 15,
                            color: Theme.of(context).primaryColor,
                            iconSize: 30,
                            splashColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            onPressed: () {
                              _save();
                            },
                          ),
                          FocusedMenuHolder(
                            child: Icon(
                              Icons.info_outlined,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                            openWithTap: true,
                            duration: Duration(milliseconds: 500),
                            menuItemExtent: 50,
                            animateMenuItems: true,
                            menuItems: <FocusedMenuItem>[
                              FocusedMenuItem(
                                backgroundColor: Theme.of(context).primaryColor,
                                trailingIcon: Icon(
                                  Icons.info_outline,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                title: Text(
                                  'Source - Pexels.com',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                            blurSize: 3,
                            onPressed: () {},
                            blurBackgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ],
                      ),
                    ),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.8),
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _save() async {
    await ImageDownloader.downloadImage(
      widget.imageurl,
      destination: AndroidDestinationType.directoryDownloads,
    ).then(
      (value) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Text(
            'Image Saved in Downloads, if not then kindly give permission',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          duration: Duration(milliseconds: 1000),
        ),
      ),
    );
  }
}
