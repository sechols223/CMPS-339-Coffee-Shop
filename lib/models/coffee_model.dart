import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_coffee/models/cart_model.dart';

class CoffeeModel {
  final String name;
  final double price;
  final String img;
  bool isselected;

  CoffeeModel({this.name, this.price, this.isselected, this.img});
}

final TextStyle style = GoogleFonts.lato(
    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700);
const Color white = Color(0xFFDCDBEB);

List<CoffeeModel> lattes = [
  CoffeeModel(
      name: 'Latte',
      img: 'lib/images/latte.jpeg',
      price: 5.00,
      isselected: false),
];

List<CoffeeModel> frappes = [
  CoffeeModel(
      name: 'Frappe',
      img: 'lib/images/frappe.jpg',
      price: 7.00,
      isselected: false),
];

List<CoffeeModel> macchiatos = [
  CoffeeModel(
      name: 'Macchiato',
      img: 'lib/images/macchiato.jpg',
      price: 4.00,
      isselected: false),
];

List<CoffeeModel> allcoffee = lattes + frappes + macchiatos;

List<CartModel> boughtitems = [];

List<String> sizes = ["small", "medium", "large"];

double total = 0.00;
double tax = 0.00;
