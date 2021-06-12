import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SplashStartScreen.dart';
import 'ThemeProvider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    systemNavigationBarColor: Colors.black,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    return runApp(
      ChangeNotifierProvider(
        child: WallpaperpediaPro(),
        create: (BuildContext context) => ThemeProvider(
          isDarkMode: (prefs.getBool('isDarkTheme') == null)
              ? false
              : prefs.getBool('isDarkTheme'),
        ),
      ),
    );
  });
}

class WallpaperpediaPro extends StatefulWidget {
  @override
  _WallpaperpediaProState createState() => _WallpaperpediaProState();
}

class _WallpaperpediaProState extends State<WallpaperpediaPro>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(microseconds: 350000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.getTheme,
          home: SplashStartScreen(),
        );
      },
    );
  }
}
