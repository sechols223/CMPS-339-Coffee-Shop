/*
  HomePage created with sample coffees to make sure design is right
  and add to cart is working fine. 
*/
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_coffee/models/coffee_model.dart';
import 'package:flutter_coffee/screens/pages/details_page.dart';
import 'package:flutter_coffee/screens/pages/mycart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Voted #1 Coffee Shop 2022',
              style: style.copyWith(color: Colors.black, fontSize: 16),
            ),
          ),
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TabBar(
                  controller: _controller,
                  unselectedLabelStyle: style.copyWith(fontSize: 14),
                  labelStyle: style.copyWith(fontSize: 14),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.brown),
                  unselectedLabelColor: Colors.grey.shade800,
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Lattes',
                    ),
                    Tab(
                      text: 'Frappes',
                    ),
                    Tab(
                      text: 'Macchiatos',
                    ),
                  ]),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(controller: _controller, children: [
                  _buildlistitem(items: allcoffee),
                  _buildlistitem(items: lattes),
                  _buildlistitem(items: frappes),
                  _buildlistitem(items: macchiatos),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildlistitem({List<CoffeeModel> items}) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? BounceInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index))
              : BounceInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index));
        });
  }

  Widget _builditem({List<CoffeeModel> myitems, int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsPage(
                      item: myitems[index],
                    )));
      },
      child: AspectRatio(
        aspectRatio: 4 / 1,
        child: Container(
          margin: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('lib/images/coffees.jpg'),
              alignment: Alignment.topLeft,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5, color: Colors.brown, offset: Offset(0, 0))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${myitems[index].size + ' '}',
                          style: style.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Text(
                          '${myitems[index].name + ' '}',
                          style: style.copyWith(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${myitems[index].price}',
                          style: style.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
