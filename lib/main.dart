import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/provider/themes_provider.dart';
import 'package:sudoku_solver/screens/sudoku_solver.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      home: const SudokuSolver(),
    );
  }
}
