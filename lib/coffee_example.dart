import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_coffee/models/cart_model.dart';
import 'package:flutter_coffee/models/coffee_model.dart';

final TextStyle style = GoogleFonts.lato(
    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700);
const Color white = Color(0xFFDCDBEB);

List<CoffeeModel> lattes = [
  CoffeeModel(
      name: 'Latte', img: 'lib/images/latte.jpeg', price: 5, isselected: false),
];

List<CoffeeModel> frappes = [
  CoffeeModel(
      name: 'Frappe',
      img: 'lib/images/frappe.jpg',
      price: 6,
      isselected: false),
];

List<CoffeeModel> macchiatos = [
  CoffeeModel(
      name: 'Macchiatto',
      img: 'lib/images/macchiatto.jpg',
      price: 7,
      isselected: false),
];

List<CoffeeModel> allcoffee = lattes + frappes + macchiatos;

List sizes = [8, 12, 16];

List<CartModel> boughtitems = [];

double total = 0.00;
