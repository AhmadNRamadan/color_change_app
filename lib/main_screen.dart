import 'dart:math';
import 'package:color_change/change_color_button.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color _randomColor = Color.fromARGB(255, 85, 49, 49);
  Color _getRandomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }

  String directionKey = "Vertical";
  Map<String, AlignmentDirectional> gradientBeginDirection = {
    "Vertical": AlignmentDirectional.centerStart,
    "Horizontal": AlignmentDirectional.topCenter,
    "Left-Right": AlignmentDirectional.bottomStart,
    "Right-Left": AlignmentDirectional.topStart,
  };

  Map<String, AlignmentDirectional> gradientEndDirection = {
    "Vertical": AlignmentDirectional.centerEnd,
    "Horizontal": AlignmentDirectional.bottomCenter,
    "Left-Right": AlignmentDirectional.topEnd,
    "Right-Left": AlignmentDirectional.bottomEnd,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_randomColor, Colors.white, _randomColor],
            begin: gradientBeginDirection[directionKey]!,
            end: gradientEndDirection[directionKey]!,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChangeColorButton(
              onPressed: () {
                setState(() {
                  _randomColor = _getRandomColor();
                });
              },
              text: "Change Color",
            ),
            const SizedBox(height: 8),
            Text(
              "Red: ${_randomColor.r.toStringAsFixed(2)} Green: ${_randomColor.g.toStringAsFixed(2)} Blue: ${_randomColor.b.toStringAsFixed(2)}",
            ),
            const SizedBox(height: 18),
            ChangeColorButton(
              onPressed: () {
                setState(() {
                  switch (directionKey) {
                    case "Vertical":
                      directionKey = "Horizontal";
                      break;
                    case "Horizontal":
                      directionKey = "Left-Right";
                      break;
                    case "Left-Right":
                      directionKey = "Right-Left";
                      break;
                    case "Right-Left":
                      directionKey = "Vertical";
                      break;
                    default:
                      break;
                  }
                });
              },
              text: "Change Direction",
            ),
            const SizedBox(height: 8),
            Text("Alignment: $directionKey"),
          ],
        ),
      ),
    );
  }
}
