import 'package:flutter/material.dart';

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
  int n = 0; //numero de cliques
  int dn = 0; //numero de cliques duplos
  late String text1 = 'Um: $n';

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: widget.size,
          height: widget.size,
          color: click == false ? Colors.blue : Colors.lightGreenAccent,
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
      ),
    );
  }
}
