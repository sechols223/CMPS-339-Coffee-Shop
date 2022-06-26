/*
  Sample details page that is using sample coffees to fill the cart.
  Need to rework so its accessed through the database
*/
import 'package:flutter/material.dart';
import 'package:flutter_coffee/models/cart_model.dart';

import 'package:flutter_coffee/coffee_example.dart';
import 'package:flutter_coffee/models/coffee_model.dart';

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
  int value = 0;
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.0),
              ],
              begin: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              _buildupperpart(
                  screenwidth: _screenwidth, screenheight: _screenheight),
              _buildbottompart(_screenheight)
            ],
          )),
    );
  }

  Expanded _buildbottompart(double _screenheight) {
    return Expanded(
        child: Container(
      color: white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.item.name,
              style: style.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Size',
              style: style.copyWith(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildsizes(),
            const SizedBox(
              height: 30,
            ),
            _buildbutton(_screenheight)
          ],
        ),
      ),
    ));
  }

  Flexible _buildbutton(double _screenheight) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        height: _screenheight * .08,
        width: double.maxFinite,
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
                  img: widget.item.img,
                  items: 1,
                  size: sizes[value],
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
                Icons.backpack,
                color: white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Add To Cart',
                style: style.copyWith(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
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
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: white,
                    size: 40,
                  ),
                ),
                const Spacer(),
              ],
            ),
            Center(
              child: Image.asset(
                widget.item.img,
                width: 500,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildsizes() {
    return SizedBox(
        height: 40,
        width: 500,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            _buildsizesitem(index: 0, title: sizes[0]),
            _buildsizesitem(index: 1, title: sizes[1]),
            _buildsizesitem(index: 2, title: sizes[2]),
          ],
        ));
  }

  Widget _buildsizesitem({int index, int title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: value == index ? Colors.brown : Colors.transparent,
          ),
          child: Center(
              child: Text(
            title.toString(),
            style: style.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: value == index ? Colors.white : Colors.black,
            ),
          )),
        ),
      ),
    );
  }
}
