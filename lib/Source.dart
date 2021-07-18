import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Homepage.dart';

class Source extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                Center(
                  child: Text(
                    'All images used in Wallpaperpedia are from PEXELS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    openurl();
                  },
                  child: Text(
                    'Check them Out',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    openurl();
                  },
                  child: Image.asset(
                    'images/pexels.png',
                  ),
                ),
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
  openurl() {
    String url = "https://www.pexels.com/";
    launch(url);
  }
}
