import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_coffee/models/cart_model.dart';

class CoffeeModel {
  final String name;
  final double price;
  final String size;
  bool isselected;

  CoffeeModel({this.name, this.price, this.isselected, this.size});
}

final TextStyle style = GoogleFonts.lato(
    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700);
const Color white = Color(0xFFDCDBEB);

List<CoffeeModel> lattes = [
  CoffeeModel(name: 'Latte', size: 'small', price: 3.00, isselected: false),
  CoffeeModel(name: 'Latte', size: 'medium', price: 5.00, isselected: false),
  CoffeeModel(name: 'Latte', size: 'large', price: 7.00, isselected: false),
];

List<CoffeeModel> frappes = [
  CoffeeModel(name: 'Frappe', size: 'small', price: 3.00, isselected: false),
  CoffeeModel(name: 'Frappe', size: 'medium', price: 5.00, isselected: false),
  CoffeeModel(name: 'Frappe', size: 'large', price: 7.00, isselected: false),
];

List<CoffeeModel> macchiatos = [
  CoffeeModel(
      name: 'Macchiatto', size: 'small', price: 3.00, isselected: false),
  CoffeeModel(
      name: 'Macchiatto', size: 'medium', price: 5.00, isselected: false),
  CoffeeModel(
      name: 'Macchiatto', size: 'large', price: 7.00, isselected: false),
];

List<CoffeeModel> allcoffee = lattes + frappes + macchiatos;

List<CartModel> boughtitems = [];

double total = 0.00;
