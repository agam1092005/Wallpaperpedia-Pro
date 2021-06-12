import 'dart:async';
import 'package:flutter/material.dart';
import 'Homepage.dart';

class SplashStartScreen extends StatefulWidget {
  @override
  _SplashStartScreenState createState() => _SplashStartScreenState();
}

class _SplashStartScreenState extends State<SplashStartScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionsBuilder: (context, animation, animationTime, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: (context, animation, animationTime) {
            return HomePage();
          },
        ),
      ),
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Wallpaper",
                      style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Overpass',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "pedia",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                        fontFamily: 'Overpass',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Text(
                  "PRO",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontFamily: 'KaushanScript',
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
