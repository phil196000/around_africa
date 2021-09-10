import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';

class WhiteText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final EdgeInsets margin;
  const WhiteText(
      {Key? key,
      required this.text,
      this.weight = FontWeight.bold,
      this.size = 16,
      this.margin = const EdgeInsets.all(5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: Text(
        this.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: this.size,
          color: CustomColors.white,
          fontWeight: this.weight,
        ),
        // textAlign: TextAlign.left,
      ),
    );
  }
}
