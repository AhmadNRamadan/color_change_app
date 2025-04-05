import 'package:flutter/material.dart';

class ChangeColorButton extends StatelessWidget {
  const ChangeColorButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white)),
      child: Text(text, style: TextStyle(fontSize: 14, color: Colors.white)),
    );
  }
}
