import 'package:flutter/material.dart';
import 'package:sudoku_solver/widgets/card_tile.dart';

List<List<CardTile>> list = [];

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() {
    return _GridState();
  }
}

bool flag = false;

class _GridState extends State<Grid> {
  void validate() {
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        if (list[i][j].getNum() == -1 ||
            list[i][j].getNum() != 0 && !check(i, j)) {
          showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    insetPadding: const EdgeInsets.all(100),
                    title: const Text("Error!"),
                    content: const Text(
                      "Please make sure to enter a valid combination",
                    ),
                    actions: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                        },
                        child: const Text("Okay"),
                      )
                    ],
                  ));
          return;
        }
      }
    }
    solve(0, 0);
  }

  void clear() {
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        list[i][j].setNum('');
      }
    }
    flag = false;
  }

  bool check(int x, int y) {
    for (int i = 0; i < 9; i++) {
      if (list[x][i].getNum() == list[x][y].getNum() && y != i) {
        return false;
      }
    }
    for (int i = 0; i < 9; i++) {
      if (list[i][y].getNum() == list[x][y].getNum() && x != i) return false;
    }
    double xx = x / 3;
    double yy = y / 3;
    // int xxx = xx
    for (int i = (xx.floor()) * 3; i < (xx.floor()) * 3 + 3; i++) {
      for (int j = (yy.floor()) * 3; j < (yy.floor()) * 3 + 3; j++) {
        if (i == x && j == y) continue;
        if (list[i][j].getNum() == list[x][y].getNum()) return false;
      }
    }
    return true;
  }

  void solve(int x, int y) {
    if (y == 9) {
      solve(x + 1, 0);
      return;
    }
    if (x == 9) {
      flag = true;
      return;
    }
    if (list[x][y].getNum() == 0) {
      for (int k = 1; k <= 9; k++) {
        list[x][y].setNum(k.toString());
        if (check(x, y)) {
          solve(x, y + 1);
        }
        if (flag) return;

        list[x][y].setNum("0");
      }
    } else {
      solve(x, y + 1);
    }
  }

  @override
  void initState() {
    for (var i = 0; i < 9; i++) {
      List<CardTile> soto = [];
      list.add(soto);
      for (var j = 0; j < 9; j++) {
        // list[i][j] = CardTile();
        list[i].add(CardTile(
          ctrl: TextEditingController(),
        ));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 90),
              ...list.map(
                (toElement) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [...toElement.map((toCell) => toCell)],
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  validate();
                },
                style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 18,
                  ),
                )),
                child: const Text("Solve!"),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  clear();
                },
                style: const ButtonStyle(
                    padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 18,
                  ),
                )),
                child: const Text("Clear"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
