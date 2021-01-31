import 'package:flutter/material.dart';

class repeated_container extends StatelessWidget {
  repeated_container({@required this.colour,this.chd});
  final Color colour;
  final Widget chd;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: chd,
      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)), color: colour),
    );
  }
}