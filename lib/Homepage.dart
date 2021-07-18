import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'wallpapers.dart';
import 'search.dart';
import 'modals.dart';
import 'data.dart';
import 'Categories.dart';
import 'About_page.dart';
import 'ThemeProvider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int noOfImageToLoad = 80;
  // ignore: deprecated_member_use
  List<PhotosModel> photos = new List();
  // ignore: non_constant_identifier_names
  int page = 1;
  // ignore: deprecated_member_use
  List<CategoriesModal> categories = new List();
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getTrendingWallpaper();
    categories = getCategories();
  }

  // ignore: non_constant_identifier_names
  ThemeChanger() {
    if (Theme.of(context).scaffoldBackgroundColor == Color(0xFF121212)) {
      return IconButton(
        padding: EdgeInsets.symmetric(horizontal: 16),
        icon: Icon(Icons.nights_stay_outlined),
        color: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
        splashRadius: 20,
        iconSize: 30,
        onPressed: () {
          ThemeProvider themeProvider = Provider.of<ThemeProvider>(
            context,
            listen: false,
          );
          themeProvider.swapTheme();
        },
      );
    } else
      return IconButton(
        padding: EdgeInsets.symmetric(horizontal: 16),
        icon: Icon(Icons.wb_sunny_outlined),
        color: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
        splashRadius: 20,
        iconSize: 30,
        onPressed: () {
          ThemeProvider themeProvider = Provider.of<ThemeProvider>(
            context,
            listen: false,
          );
          themeProvider.swapTheme();
        },
      );
  }

  Widget brandName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Wallpaper",
          textScaleFactor: 1,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Overpass',
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          "pedia",
          textScaleFactor: 1,
          style: TextStyle(
            color: Colors.blue,
            fontFamily: 'Overpass',
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget DrawerbrandName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Wallpaper",
          textScaleFactor: 1,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Overpass',
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          "pedia",
          textScaleFactor: 1,
          style: TextStyle(
            color: Colors.blue,
            fontFamily: 'Overpass',
            fontWeight: FontWeight.w900,
          ),
        )
      ],
    );
  }

  getTrendingWallpaper() async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad"),
        headers: {
          "Authorization":
              '563492ad6f917000010000019573fe6428244d06a1c94b650d646fb4'
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });

      setState(() {});
    });
  }

  // ignore: non_constant_identifier_names
  LoadMore() async {
    setState(() {
      page = page + 1;
    });
    String url =
        'https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=' +
            page.toString();
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          '563492ad6f917000010000019573fe6428244d06a1c94b650d646fb4',
    }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            LoadMore();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  child: Center(
                    child: Text(
                      'Load More',
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          actions: [
            ThemeChanger(),
          ],
          title: brandName(),
        ),
        drawer: Drawer(
          elevation: 8,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 16),
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    child: Text(
                      'Welcome',
                      textScaleFactor: 4,
                      style: TextStyle(
                        fontFamily: 'KaushanScript',
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: (Theme.of(context).scaffoldBackgroundColor ==
                              Color(0xFFFFFFFF)
                          ? Color(0xFFd2d2d2)
                          : Color(0xFF303030)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                    ),
                    child: Center(
                      child: ListTile(
                        trailing: Icon(
                          Icons.home_outlined,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
                          pageBuilder:
                              (context, animation, animationTime) {
                            return About();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: (Theme.of(context).scaffoldBackgroundColor ==
                                Color(0xFFFFFFFF)
                            ? Color(0xFFd2d2d2)
                            : Color(0xFF303030)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          trailing: Icon(
                            Icons.question_answer_outlined,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text(
                            'About',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                DrawerbrandName(),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        30,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    cursorColor: Colors.blue,
                    autofocus: false,
                    autocorrect: false,
                    controller: searchController,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (searchController.text != "") {
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
                                pageBuilder:
                                    (context, animation, animationTime) {
                                  return Search(
                                    searchQuery: searchController.text,
                                  );
                                },
                              ),
                            );
                          }
                        },
                        child: Container(
                          child: Icon(
                            Icons.search_outlined,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      hintText: 'Search here...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    'Collections',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoriesTile(
                        imageurl: categories[index].imageurl,
                        title: categories[index].categoriesName,
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    'Newly Added',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                wallPaper(photos, context),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoriesTile extends StatelessWidget {
  final String imageurl, title;
  CategoriesTile({@required this.title, @required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionsBuilder: (context, animation, animationTime, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return Categories(
                CategoryName: title,
              );
            },
          ),
        );
      },
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 100,
              width: 200,
              margin: EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
                child: Image.network(
                  imageurl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
              ),
              height: 100,
              width: 200,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
