import 'package:flutter/material.dart';

class SquareWidget extends StatefulWidget {
  final double size;
  MaterialColor color = Colors.blue;

  SquareWidget({super.key, required this.size, this.color = Colors.blue});

  @override
  State<SquareWidget> createState() => _SquareWidgetState();
}

class _SquareWidgetState extends State<SquareWidget> {
  bool click = false;
  int n = 0; //numero de cliques
  int dn = 0; //numero de cliques duplos
  late String text1 = 'Um: $n';
  Color color = Color(0xffe3ffc7);
  Color color2 = Color(0xff2196f3);

  void tap() {
    setState(() {
      click = !click;
      click ? widget.color = Colors.amber : widget.color = Colors.blue;
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
          color: widget.color,
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
