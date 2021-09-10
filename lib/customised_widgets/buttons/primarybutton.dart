import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final double elevation;
  final bool indicator;

  PrimaryButton(
      {this.onPressed,
      this.buttonText = '',
      this.elevation = 10,
      this.indicator = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: CustomColors.secondary,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          elevation: this.onPressed == null ? 0 : this.elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
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
          : Text(this.buttonText,
              style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
    );
  }
}
