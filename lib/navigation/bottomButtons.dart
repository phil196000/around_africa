import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key, this.phonePressed, this.emailPressed})
      : super(key: key);
  final void Function()? phonePressed;
  final void Function()? emailPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: CustomColors.black,
                ),
                onPressed: phonePressed,
                child: Icon(
                  Icons.phone,
                  color: CustomColors.white,
                  size: 35,
                ))),
        Expanded(
            child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    backgroundColor: CustomColors.secondary),
                onPressed: emailPressed,
                child: Icon(
                  Icons.mail,
                  color: CustomColors.white,
                  size: 35,
                )))
      ],
    );
  }
}
