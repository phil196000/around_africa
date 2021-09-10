import 'package:around_africa/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final void Function(BuildContext context)? onPressed;
  final BuildContext context;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  CustomAppBar({
    this.onPressed,
    required this.context,
    this.onChanged,
    this.controller,
  }) : super(
            iconTheme: IconThemeData(
              color: CustomColors.white, //change your color here
            ),
            backgroundColor: CustomColors.primary,
            automaticallyImplyLeading: false,
            title: TextField(
              onChanged: onChanged,
              controller: controller,
              style: TextStyle(
                  color: CustomColors.ash, fontWeight: FontWeight.bold),
              cursorColor: CustomColors.primary,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  fillColor: CustomColors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                          style: BorderStyle.none,
                          color: CustomColors.white,
                          width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide:
                          BorderSide(color: CustomColors.ash, width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                          style: BorderStyle.none,
                          color: CustomColors.ash,
                          width: 0)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        color: CustomColors.ash,
                        width: 0,
                        style: BorderStyle.none,
                      ))),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () => onPressed!(context), icon: Icon(Icons.menu)),
            ));
}
