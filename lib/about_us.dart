import 'package:flutter/material.dart';
import 'Homepage.dart';

class AboutUs extends StatelessWidget {
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
                          pageBuilder: (context, animation, animationTime) {
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 200,
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'images/TechUtility.png',
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Wallpaper",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Overpass',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "pedia",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontFamily: 'Overpass',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "Pro",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                      fontFamily: 'KaushanScript',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Explore Infinite Wallpapers with Wallpaperpedia. Like its name, it is really like an Encyclopedia of Wallpapers, Enjoy HD Wallpapers with no Limits.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Thank you for purchasing our Pro version app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Thank you for downloading our app, Kindly take 2 minute and rate our app on playstore',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_border_sharp,
                      size: 50,
                    ),
                    Icon(
                      Icons.star_border_sharp,
                      size: 50,
                    ),
                    Icon(
                      Icons.star_border_sharp,
                      size: 50,
                    ),
                    Icon(
                      Icons.star_border_sharp,
                      size: 50,
                    ),
                    Icon(
                      Icons.star_border_sharp,
                      size: 50,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 10000,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Build 1.0',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'by TechUtility - 2021',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
