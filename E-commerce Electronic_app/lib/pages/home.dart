// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:electronic_app/model/item.dart';
import 'package:electronic_app/pages/about.dart';
import 'package:electronic_app/pages/checkout.dart';
import 'package:electronic_app/pages/details_screen.dart';
import 'package:electronic_app/provider/cart.dart';
import 'package:electronic_app/shared/appbar.dart';
import 'package:electronic_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final String? username;
  final String? email;

  const Home(
      {Key? key, this.username = "Mostafa", this.email = "mostafa@gmail.com"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 33),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(product: items[index]),
                      ),
                    );
                  },
                  child: GridTile(
                    child: Stack(children: [
                      Positioned(
                        top: -3,
                        bottom: -9,
                        right: 0,
                        left: 0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(55),
                            child: Image.asset(items[index].imgPath)),
                      ),
                    ]),
                    footer: GridTileBar(
// backgroundColor: Color.fromARGB(66, 73, 127, 110),
                      trailing: IconButton(
                          color: Color.fromARGB(255, 62, 94, 70),
                          onPressed: () {
                            carttt.add(items[index]);
                          },
                          icon: Icon(Icons.add)),

                      leading: Text("\$${items[index].price}"),

                      title: Text(
                        "",
                      ),
                    ),
                  ),
                );
              }),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/cover_2.jpg"),
                        fit: BoxFit.cover
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/img/profile_1.jpg"),
                    ),
                    accountEmail: Text(
                      '$email',
                      style: TextStyle(color: Colors.white , fontSize:16 , fontWeight:FontWeight.w500),
                    ),
                    accountName: Text(
                      '$username',
                      style: TextStyle(color: Colors.white , fontSize:16 , fontWeight:FontWeight.w500),
                    ),
                  ),
                  ListTile(
                      title: Text("Home"),
                      leading: Icon(Icons.home),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      }),
                  ListTile(
                      title: Text("My products"),
                      leading: Icon(Icons.add_shopping_cart),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOut(),
                          ),
                        );
                      }),
                  ListTile(
                      title: Text("About"),
                      leading: Icon(Icons.help_center),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => About(),
                          ),
                        );
                      }),
                  // ListTile(
                  //     title: Text("Logout"),
                  //     leading: Icon(Icons.exit_to_app),
                  //     onTap: () {}),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Text(
                    "Developed by : mostafa, nada, Doha, Fatma, Rehab © 2024",
                    style: TextStyle(fontSize: 13.5)),
              )
            ],
          ),
        ),
        appBar: AppBar(
          actions: [ProductsAndPrice()],
          backgroundColor: appbarGreen,
          title: Text("Home"),
        ));
  }
}
