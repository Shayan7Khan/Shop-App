import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/pages/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    //whenever we want to listen to something continously in relation to a provider we have to do that in the buildContext otherwise listen would be set to false
    //now what i wrote down, its bit lengthy instead i can write watch() as well and they both mean same thing. just like i did below
    //final cart = Provider.of<CartProvider>(context).cart;

    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          //listtile() provides all the necessary things that we will use to display in our cart.
          return ListTile(
            //leading is used to put whatever we give it to it to the start.
            //circleAvatar as the name suggests display the image in circle frame.
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete Product',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: Text('Are you sure BSDK ???'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context
                                  .read<CartProvider>()
                                  .removeProduct(cartItem);
                              //the below and above statements means the same things but we did it to make it bit handy and less lenghty.

                              //Provider.of<CartProvider>(context, listen: false)
                              //     .removeProduct(cartItem);

                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'No',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      );
                    });
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('${cartItem['price']}'),
          );
        },
      ),
    );
  }
}
