import 'package:flutter/material.dart';

class CardTile extends StatefulWidget {
  CardTile({super.key, required this.ctrl});
  TextEditingController ctrl;
  @override
  State<CardTile> createState() {
    return _CardState();
  }

  int getNum() {
    if (ctrl.text.isEmpty) return 0;
    return int.tryParse(ctrl.text) != null ? int.parse(ctrl.text) : -1;
  }

  void setNum(String s) {
    ctrl.text = s;
  }
}

// final ctrl = TextEditingController(text: "0");

class _CardState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 10.0;
    return SizedBox(
      height: width,
      width: width,
      child: Card(
        margin: const EdgeInsets.all(2.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Align(
          alignment: Alignment.center,
          child: TextField(
            controller: widget.ctrl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.47,
              fontWeight: FontWeight.bold,
            ),
            cursorHeight: 25,
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              counterText: "",
              border: InputBorder.none,
              alignLabelWithHint: true,
              isDense: true,
              isCollapsed: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }
}
