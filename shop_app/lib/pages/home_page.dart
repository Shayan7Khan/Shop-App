import 'package:flutter/material.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //to keep the track of screen we are on
  int currentPage = 0;

  List<Widget> pages = [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //indexedStack keeps the track of the screen meaning that if we scroll down and go to cart and come back to the screen again it wont go up instead it would be where we left it.
      // index keeps the count of current page and children wants a list of widgets which pages is actually. so if index is 0 pages would load the produclist screen if its 1 it will load the cartpage.
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          //label takes the space in the bottom bar even if we didnt add text there so to eliminate that space we used selectedfontsize and unselected font size to 0.
          selectedFontSize: 0,
          unselectedFontSize: 0,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '',
            ),
          ]),
    );
  }
}
