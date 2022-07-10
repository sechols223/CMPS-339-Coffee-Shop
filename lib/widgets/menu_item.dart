// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_coffee/widgets/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSeleted;
  final Function(bool) onHover;
  final bool isHovered;

  const MenuItem({
    Key key,
    this.text,
    this.icon,
    this.onTap,
    this.isSeleted,
    this.onHover,
    this.isHovered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onHover: onHover,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              const SizedBox(width: kdefaultPadding * 2.5),
              FaIcon(
                icon,
                color: isSeleted || isHovered ? kWhiteColor : kGreyColor,
                size: 16,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                    color: isSeleted || isHovered ? kWhiteColor : kGreyColor,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
