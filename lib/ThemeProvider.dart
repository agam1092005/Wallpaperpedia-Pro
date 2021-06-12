import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme;

  ThemeData dark = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFF121212),
    primaryColor: Color(0xFFFFFFFF),
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
  );

  ThemeData light = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    primaryColor: Color(0xFF121212),
    iconTheme: IconThemeData(color: Color(0xFF121212)),
  );

  ThemeProvider({bool isDarkMode}){
    _selectedTheme = isDarkMode ? dark : light;
  }

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_selectedTheme == dark) {
      _selectedTheme = light;
      prefs.setBool('isDarkTheme', false);
    } else {
      _selectedTheme = dark;
      prefs.setBool('isDarkTheme', true);
    }
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}
