import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SquareWidget extends StatefulWidget {
  final double size;

  const SquareWidget({
    super.key,
    required this.size,
  });

  @override
  State<SquareWidget> createState() => _SquareWidgetState();
}

class _SquareWidgetState extends State<SquareWidget> {
  bool click = false;
  int n = 0;
  int dn = 0;

  void tap() {
    setState(() {
      click = !click;
      n += 1;
    });
  }

  void doubleTap() {
    setState(() {
      dn += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.size,
        height: widget.size,
        color: click == false ? Colors.blue : Colors.amber,
        child: Stack(
          children: [
            Center(
              child: Text("Cliques: $n. Cliques duplos: $dn."),
            ),
            GestureDetector(
              onDoubleTap: () {
                doubleTap();
              },
              onTap: () {
                tap();
              },
            ),
          ],
        ),
      ),
    );
  }
}
