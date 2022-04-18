import 'package:ewallet/constants.dart';
import 'package:ewallet/provider/cart.dart';
import 'package:ewallet/provider/product_provider.dart';
import 'package:ewallet/screens/cart_screen.dart';
import 'package:ewallet/widgets/app_drawer.dart';
import 'package:ewallet/widgets/badge.dart';
import 'package:ewallet/widgets/costume_row.dart';
import 'package:ewallet/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favourite,
  All,
}

class HomePageShop extends StatefulWidget {
  HomePageShop({Key? key}) : super(key: key);
  static const routeName = 'HomePageShop';
  @override
  State<HomePageShop> createState() => _HomePageShopState();
}

class _HomePageShopState extends State<HomePageShop> {
  bool _showFavourite = false;
  bool _isInit = true;
  bool _loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _loading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((value) {
        setState(() {
          _loading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  } //to load until products is loaded

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton,
      appBar: AppBar(
        primary: true,
        backgroundColor: kWhite,
        foregroundColor: kMainBlue,
        elevation: 0,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: PopupMenuButton(
                onSelected: (FilterOptions selectedItem) {
                  setState(() {
                    if (selectedItem == FilterOptions.Favourite) {
                      _showFavourite = true;
                    } else {
                      _showFavourite = false;
                    }
                  });
                },
                icon: const Icon(Icons.filter_vintage),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text('My Favourites'),
                    value: FilterOptions.Favourite,
                  ),
                  const PopupMenuItem(
                    child: Text('All'),
                    value: FilterOptions.All,
                  ),
                ],
              )),
          Consumer<Cart>(
            builder: (context, cartData, ch) =>
                Badge(child: ch!, value: cartData.itemCount.toString()),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.cartScreen);
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                CostumeRow(),
                ProductsGrid(
                  showFavs: _showFavourite,
                ),
              ],
            ),
    );
  }
}
