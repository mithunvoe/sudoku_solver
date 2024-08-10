import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 81, 168),
  brightness: Brightness.dark,
);

final lightTheme = ThemeData().copyWith(
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.onPrimaryContainer,
    foregroundColor: kColorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kColorScheme.secondaryContainer,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: kColorScheme.primaryContainer,
  )),
  textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: kColorScheme.onSecondaryContainer,
        ),
      ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: kDarkColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kDarkColorScheme.onPrimaryContainer,
    foregroundColor: kDarkColorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kDarkColorScheme.secondaryContainer,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: kDarkColorScheme.primaryContainer,
  )),
  textTheme: ThemeData.dark().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: kDarkColorScheme.onSecondaryContainer,
        ),
      ),
);

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode;
  bool isLightTheme;

  ThemeProvider({
    this.themeMode = ThemeMode.system,
  }) : isLightTheme = WidgetsBinding.instance.window.platformBrightness == Brightness.light;

  void toggleTheme() async {
    if (themeMode == ThemeMode.light || (themeMode == ThemeMode.system && isLightTheme)) {
      themeMode = ThemeMode.dark;
      isLightTheme = false;
    } else {
      themeMode = ThemeMode.light;
      isLightTheme = true;
    }
    notifyListeners();
  }
}
