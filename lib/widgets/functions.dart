/* import 'package:sudoku_solver/widgets/card_tile.dart';

bool check(int x, int y, list) {
  for (int i = 0; i < 9; i++) {
    if (list[x][i].getNum() == list[x][y].getNum() && y != i) return false;
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

void solve(int x, int y, List<List<CardTile>> list, bool flag) {
  if (y == 9) {
    solve(x + 1, 0, list, flag);
    return;
  }
  if (x == 9) {
    flag = true;
    return;
  }
  if (list[x][y].getNum() == 0) {
    for (int k = 1; k <= 9; k++) {
      list[x][y].setNum(k.toString());
      if (check(x, y, list)) {
        solve(x, y + 1, list, flag);
      }
      if (flag) return;

      list[x][y].setNum("0");
    }
  } else {
    solve(x, y + 1, list, flag);
  }
}
 */