import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar()
      : preferredSize = Size.fromHeight(50),
        super();

  @override
  final Size preferredSize; // default is 56.0
  @override
  State<CustomAppBar> createState() => _CustomAppBar();
}

class _CustomAppBar extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 500,
      height: 100,
      alignment: Alignment.center,
      child: Row(children: [
        Container(
          color: Colors.red,
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Home"),
              Text("Catalog"),
              Text("About Us"),
              Text("Contact"),
              Text("Home")
            ],
          ),
        ),
      ]),
    );
  }
}
