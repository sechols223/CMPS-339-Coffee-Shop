// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

ProductModel productModelJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int id;
  String name;
  String size;

  ProductModel({this.id, this.name, this.size});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(id: json["id"], name: json["name"], size: json["size"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "size": size,
      };

  // String get name => name;
  // String get size =>size;
}
