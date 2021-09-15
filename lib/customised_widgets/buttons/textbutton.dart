import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Alignment align;
  final Color backgroundColor;
  final double size;
  final Color color;
  final EdgeInsets padding;
  final bool indicator;

  const ButtonText(
      {Key? key,
      this.onPressed,
      this.padding = const EdgeInsets.all(5),
      this.color = CustomColors.black,
      this.size = 18,
      required this.text,
      this.align = Alignment.center,
      this.backgroundColor = Colors.transparent,
      this.indicator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(this.padding),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)))),
        onPressed: this.onPressed,
        child: indicator
            ? Container(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(CustomColors.white),
                  strokeWidth: 2,
                ),
              )
            : Text(
                this.text,
                style: TextStyle(
                    fontSize: this.size,
                    color: this.color,
                    fontWeight: FontWeight.bold),
              ));
  }
}
