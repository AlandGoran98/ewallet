import 'package:ewallet/constants.dart';
import 'package:ewallet/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;
  const CartItems(
      {Key? key,
      required this.id,
      required this.productId,
      required this.title,
      required this.price,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        padding: EdgeInsets.only(right: 4.0),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: kWhite,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text("do you want to remove the products?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('yes'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('no'),
                    ),
                  ],
                ));
      },
      onDismissed: (dir) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: FittedBox(child: Text("\$${price}"))),
            ),
            title: Text(title),
            subtitle: Text('Total \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
