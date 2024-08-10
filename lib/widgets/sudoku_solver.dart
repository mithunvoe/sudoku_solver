import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/main.dart';
import 'package:sudoku_solver/provider/themes_provider.dart';
import 'package:sudoku_solver/widgets/drawer.dart';
import 'package:sudoku_solver/widgets/grid.dart';
import 'package:sudoku_solver/widgets/link_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch_dark_light/flutter_switch_dark_light.dart';

class SudokuSolver extends StatefulWidget {
  const SudokuSolver({super.key});
  @override
  State<SudokuSolver> createState() {
    return _SudokuState();
  }
}

class _SudokuState extends State<SudokuSolver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: DrawerTab(),
      appBar: AppBar(
        title: Text(
          "Sudoku Solver",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontFamily: GoogleFonts.aBeeZee().fontFamily,
                // fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Switch(
            value: context.watch<ThemeProvider>().isLightTheme,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            inactiveThumbImage: const ResizeImage(
              AssetImage(
                'assets/img/moon.png',
              ),
              width: 25,
              height: 25,
            ),
            inactiveThumbColor: Colors.white,
            activeThumbImage: const ResizeImage(
              AssetImage('assets/img/sun.png'),
              width: 25,
              height: 25,
            ),
            activeColor: Colors.white,
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
            activeTrackColor: Theme.of(context).colorScheme.primaryContainer,
          )
        ],
      ),
      body: const Grid(),
    );
  }
}
