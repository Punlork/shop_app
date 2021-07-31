import 'package:flutter/material.dart';

import '../widgets/product_gridview.dart';

enum optionsFilter {
  favorite,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Shop',
        ),
        actions: [
          PopupMenuButton(
            onSelected: (optionsFilter selectedValue) {
              setState(() {
                if (selectedValue == optionsFilter.favorite) {
                  _showOnlyFavorite = true;
                } else {
                  _showOnlyFavorite = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favotire'),
                value: optionsFilter.favorite,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: optionsFilter.all,
              ),
            ],
            icon: Icon(
              Icons.more_vert,
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorite),
    );
  }
}
