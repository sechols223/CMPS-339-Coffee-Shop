// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu {
  final IconData icon;
  final String title;

  Menu(this.icon, this.title);
}

final List<Menu> menuList = [
  Menu(FontAwesomeIcons.person, "Login"),
  Menu(FontAwesomeIcons.home, "Home"),
  Menu(FontAwesomeIcons.shoppingBag, "Products"),
  Menu(FontAwesomeIcons.clipboardCheck, "Management"),
];
