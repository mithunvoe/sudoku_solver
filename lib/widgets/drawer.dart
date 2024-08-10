import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'link_text.dart';

class DrawerTab extends StatefulWidget {
  @override
  State<DrawerTab> createState() {
    return _DrawerTabState();
  }
}

class _DrawerTabState extends State<DrawerTab> {

  void onQuestionBtn() {
    showCupertinoDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("How To?"),
          content: const Text(
              "This app helps gets you the solution of a valid Sudoku problem. To use this app, you just have to fill the grids as per given and press the solve button. Your can clear the grids just by pressing the clear button. Invalid grids may lead to error."),
          actions: [
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Continue"))
          ],
        ));
  }

  void onAboutBtn() {
    const email = 'mailto:kabyasaha1812@gmai.com';
    const fb = 'https://www.facebook.com/mithunvoe';
    const github = 'https://github.com/mithunvoe';
    showAboutDialog(
        context: context,anchorPoint: const Offset(20, 0),

        applicationIcon: Icon(Icons.grid_on_rounded),
        applicationVersion: "0.0.1",
        applicationName: "Sudoku Solver",
        children: [
          Container(
            // padding: const EdgeInsets.only(top: 50),
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Quota movement was going over Bangladesh. Internet connection was totally down for many days. I just had a few lessons of flutter earlier. One day (21st July) after seeing a Sudoku puzzle on the newspaper, it came across my mind if I could make something out of it. Then I tried to make this app out of scratch. Though its not well furnished, my code is also kinda filthy, still it was a fun project to make :D"),
                Text(
                  '\nAbout me:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 3),
                const Text(
                    "Kabya Mithun Saha\nDepartment of Computer Science and Engineering\nUniversity of Dhaka\n"),
                Text(
                  "Contact me:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 3),
                const LinkText(header: "Facebook", url: fb),
                const LinkText(header: "Email", url: email),
                const LinkText(header: "GitHub", url: github),
              ],
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.grid_on,
                    color: Theme.of(context).colorScheme.surface,
                    size: 30,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Sudoku Solver",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Theme.of(context).colorScheme.surface),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_rounded),
            title: const Text("Help"),
            onTap: () {
              // Navigator.pop(context);
              onQuestionBtn();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text("About"),
            onTap: () {
              // Navigator.pop(context);
              onAboutBtn();
            },
          ),
        ],
      ),
    );
  }
}
