import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'About_page.dart';
import 'Homepage.dart';
import 'wallpapers.dart';
import 'modals.dart';

class Search extends StatefulWidget {
  final searchQuery;
  Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    getSearchWallpaper(widget.searchQuery);
    searchController.text = widget.searchQuery;
    super.initState();
  }

  // ignore: deprecated_member_use
  List<PhotosModel> photos = new List();
  TextEditingController searchController = new TextEditingController();
  int page = 1;

  getSearchWallpaper(String searchQuery) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30"),
        headers: {
          "Authorization":
              '563492ad6f917000010000019573fe6428244d06a1c94b650d646fb4'
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {});
    });
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
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  LoadMoreSearch(String searchQuery) async {
    setState(() {
      page = page + 1;
    });
    String url =
        'https://api.pexels.com/v1/search?query=$searchQuery&per_page=30&page=' +
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
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
                            return HomePage();
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
        floatingActionButton: GestureDetector(
          onTap: () {
            LoadMoreSearch(widget.searchQuery);
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
          title: brandName(),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                Text(
                  'Results for ${searchController.text}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 20,
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
