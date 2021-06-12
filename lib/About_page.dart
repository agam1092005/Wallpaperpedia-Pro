import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperpedia/Benefits.dart';
import 'about_us.dart';
import 'Homepage.dart';
import 'Source.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // ignore: non_constant_identifier_names
    Widget DrawerbrandName() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Wallpaper",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'Overpass',
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            "pedia",
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
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'Overpass',
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            "pedia",
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'Overpass',
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      );
    }

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
                SizedBox(
                  height: 40,
                ),
                DrawerbrandName(),
              ],
            ),
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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Image.asset('images/about.png'),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
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
                          return AboutUs();
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
                          Icons.engineering_outlined,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          'About Us',
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
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
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
                          return Source();
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
                          Icons.info_outline,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          'Source',
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
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
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
                          return Benefits();
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
                          Icons.card_giftcard_outlined,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          'Benefits',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
