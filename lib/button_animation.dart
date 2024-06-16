import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation({Key? key}) : super(key: key);

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> {
  bool isHovered = false;

  void _onHover(bool hovering) {
    setState(() {
      isHovered = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Click Animation')),
      body: Center(
        child: MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isHovered ? 220 : 200,
            height: isHovered ? 60 : 50,
            decoration: BoxDecoration(
              color: isHovered ? Colors.blueAccent : Colors.black87,
              borderRadius: BorderRadius.circular(12),
              boxShadow: isHovered
                  ? [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                )
              ]
                  : [],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Add your onTap functionality here
                  print('Button Tapped');
                },
                borderRadius: BorderRadius.circular(12),
                child: Center(
                  child: Text(
                    'Click here!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ButtonAnimation(),
  ));
}
