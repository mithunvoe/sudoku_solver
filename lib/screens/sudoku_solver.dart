import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku_solver/provider/themes_provider.dart';
import 'package:sudoku_solver/screens/drawer.dart';
import 'package:sudoku_solver/widgets/grid.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(68.0), // Set the desired height here
        child: AppBar(
          title: Text(
            "Sudoku Solver",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  fontFamily: GoogleFonts.aBeeZee().fontFamily,
                ),
          ),
          actions: [
            Switch(
              value: context.watch<ThemeProvider>().isLightTheme,
              onChanged: (val) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              inactiveThumbImage: const AssetImage('assets/img/moon.png'),
              inactiveThumbColor: Colors.white,
              activeThumbImage: const AssetImage('assets/img/sun.png'),
              activeColor: Colors.white,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.primaryContainer,
              activeTrackColor: Theme.of(context).colorScheme.primaryContainer,
            )
          ],
        ),
      ),
      body: const Grid(),
    );
  }
}
