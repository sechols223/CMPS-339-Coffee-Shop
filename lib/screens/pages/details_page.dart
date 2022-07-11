/*
  Sample details page that is using sample coffees to fill the cart.
  Need to rework so its accessed through the database
*/
import 'package:flutter/material.dart';
import 'package:flutter_coffee/models/cart_model.dart';
import 'package:flutter_coffee/models/coffee_model.dart';
import 'package:flutter_coffee/screens/pages/mycart.dart';

class DetailsPage extends StatefulWidget {
  final CoffeeModel item;

  const DetailsPage({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyCart()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 6, right: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.black,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Cart',
                    style: style.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
          color: Colors.brown[200],
          width: size.width,
          height: size.height,
          alignment: Alignment.center,
          child: Column(
            children: [
              _buildupperpart(
                  screenwidth: _screenwidth, screenheight: _screenheight),
              _buildbottompart(_screenheight * .4, _screenwidth)
            ],
          )),
    );
  }

  Widget _buildupperpart({var screenwidth, var screenheight}) {
    return Container(
      width: screenwidth,
      height: screenheight * .7,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'lib/images/frappe.jpg',
                width: screenwidth * .5,
                height: screenheight * .65,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildbottompart(double _screenheight, double _screenwidth) {
    return Expanded(
        child: Container(
      color: Colors.brown[300],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Text(
                '${widget.item.size + ' ' + widget.item.name + ' \$' + widget.item.price.toString()}',
                style: style.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildbutton(_screenheight, _screenwidth)
          ],
        ),
      ),
    ));
  }

  Flexible _buildbutton(double _screenheight, double _screenwidth) {
    return Flexible(
      fit: FlexFit.loose,
      child: Center(
        child: Container(
          height: _screenheight * .25,
          width: _screenwidth * .6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.brown),
          child: MaterialButton(
            onPressed: () {
              if (boughtitems
                  .map((item) => item.name)
                  .contains(widget.item.name)) {
                final snackBar = SnackBar(
                    backgroundColor: Colors.brown,
                    duration: const Duration(seconds: 2),
                    content: Text(
                      'Item already in cart.',
                      style: style.copyWith(fontSize: 14, color: Colors.white),
                    ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                boughtitems.add(
                  CartModel(
                    name: widget.item.name,
                    price: widget.item.price,
                    items: 1,
                  ),
                );
                total = total + widget.item.price;
                Navigator.pop(context);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  color: white,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Add To Cart',
                  style: style.copyWith(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
