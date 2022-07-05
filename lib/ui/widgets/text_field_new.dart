import 'package:flutter/material.dart';

class TextFieldNew extends StatelessWidget {
  const TextFieldNew({
    Key? key,
    required this.textEditingController,
    required this.assetName,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String assetName;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelStyle: const TextStyle(fontWeight: FontWeight.w400),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageIcon(
              AssetImage(assetName),
              color: const Color(0xFF0758b4),
            ),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
