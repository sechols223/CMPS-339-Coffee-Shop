// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_prefixes, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee/entities/bloc/page_bloc.dart';
import 'package:flutter_coffee/models/menu_model.dart';
import 'package:flutter_coffee/widgets/constants.dart';
import 'package:flutter_coffee/widgets/menu_item.dart' as MenuItem;

class SideMenu extends StatefulWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int currentSelectedIndex = 0;
  bool isHovered = false;
  int currentHoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CMPS 339 Coffee",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.white,
                  Colors.yellow,
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "lib/images/coffee-cup.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "#1 Coffee in",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            "Hammond America",
            style: TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 20),
          ...menuList
              .asMap()
              .map((index, item) => MapEntry(
                  index,
                  MenuItem.MenuItem(
                    text: item.title,
                    icon: item.icon,
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = index;
                        context
                            .read<PageBloc>()
                            .add(ChangePageEvent(index: currentSelectedIndex));
                      });
                    },
                    isSeleted: index == currentSelectedIndex,
                    onHover: (value) {
                      if (value) {
                        setState(() {
                          currentHoveredIndex = index;
                        });
                      } else {
                        setState(() {
                          currentHoveredIndex = null;
                        });
                      }
                    },
                    isHovered: currentHoveredIndex == index,
                  )))
              .values
              .toList(),
        ],
      ),
    );
  }
}
